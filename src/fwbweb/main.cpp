/*
 * fwbweb — JSON Lines bridge for the Firewall Builder WebUI.
 *
 * One JSON request per stdin line; one JSON response per stdout line.
 * Project load/save/tree/rules walk use libfwbuilder only.
 */

#include "../../config.h"
#include "fwbuilder/libfwbuilder-config.h"
#include "fwbuilder/Constants.h"
#include "fwbuilder/Resources.h"
#include "fwbuilder/FWObjectDatabase.h"
#include "fwbuilder/FWObject.h"
#include "fwbuilder/FWException.h"
#include "fwbuilder/FWReference.h"
#include "fwbuilder/Firewall.h"
#include "fwbuilder/Policy.h"
#include "fwbuilder/NAT.h"
#include "fwbuilder/Routing.h"
#include "fwbuilder/Rule.h"
#include "fwbuilder/RuleElement.h"
#include "fwbuilder/RuleSet.h"

#include "commoninit.h"
#include "upgradePredicate.h"

#include <QCoreApplication>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QTextStream>

#include <iostream>
#include <list>
#include <string>
#include <cctype>

using namespace libfwbuilder;
using namespace std;

static FWObjectDatabase *g_db = 0;
static string g_path;
static bool g_dirty = false;

static QJsonObject errObj(const QString &msg)
{
    QJsonObject o;
    o.insert(QStringLiteral("ok"), false);
    o.insert(QStringLiteral("error"), msg);
    return o;
}

static QJsonObject okObj()
{
    QJsonObject o;
    o.insert(QStringLiteral("ok"), true);
    return o;
}

static QString u8(const string &s)
{
    return QString::fromUtf8(s.c_str());
}

static void putStrAttr(QJsonObject &attrs, FWObject *obj, const char *key)
{
    try {
        const string &v = obj->getStr(key);
        if (!v.empty())
            attrs.insert(QString::fromUtf8(key), u8(v));
    } catch (...) {
    }
}

static void putIntAttr(QJsonObject &attrs, FWObject *obj, const char *key)
{
    try {
        if (obj->getStr(key).empty() && obj->getInt(key) == 0) {
            // still expose 0 for known numeric fields when attribute exists
        }
        attrs.insert(QString::fromUtf8(key), obj->getInt(key));
    } catch (...) {
    }
}

static QJsonObject typedAttrs(FWObject *obj)
{
    QJsonObject attrs;
    static const char *str_keys[] = {
        "address", "netmask", "dnsname", "run_time", "platform", "host_OS",
        "protocol", "src_range_start", "src_range_end",
        "dst_range_start", "dst_range_end", "code", "color", "version",
        "path", "iface_type", "phys_address",
        0
    };
    for (int k = 0; str_keys[k]; ++k)
        putStrAttr(attrs, obj, str_keys[k]);

    const string t = obj->getTypeName();
    if (t == "TCPService" || t == "UDPService" || t == "TCPUDPService") {
        putStrAttr(attrs, obj, "src_range_start");
        putStrAttr(attrs, obj, "src_range_end");
        putStrAttr(attrs, obj, "dst_range_start");
        putStrAttr(attrs, obj, "dst_range_end");
    }
    if (t == "ICMPService" || t == "ICMP6Service") {
        putIntAttr(attrs, obj, "type");
        putIntAttr(attrs, obj, "code");
    }
    if (t == "IPService")
        putIntAttr(attrs, obj, "protocol_num");
    if (t == "Firewall" || t == "Cluster" || t == "Host") {
        putStrAttr(attrs, obj, "platform");
        putStrAttr(attrs, obj, "host_OS");
        putStrAttr(attrs, obj, "version");
    }
    return attrs;
}

static QJsonObject objectToJson(FWObject *obj, int depth, int max_depth);

static QJsonArray ruleElementRefs(RuleElement *re)
{
    QJsonArray arr;
    if (!re)
        return arr;
    QJsonObject meta;
    meta.insert(QStringLiteral("id"),
                u8(FWObjectDatabase::getStringId(re->getId())));
    meta.insert(QStringLiteral("neg"), re->getNeg());
    meta.insert(QStringLiteral("any"), re->isAny());
    // Put meta as first element marker? Better return objects list + flags in parent.
    for (FWObject::iterator i = re->begin(); i != re->end(); ++i) {
        FWObject *child = *i;
        FWObject *ptr = FWReference::getObject(child);
        if (!ptr)
            ptr = child;
        QJsonObject ref;
        ref.insert(QStringLiteral("id"),
                   u8(FWObjectDatabase::getStringId(ptr->getId())));
        ref.insert(QStringLiteral("name"), u8(ptr->getName()));
        ref.insert(QStringLiteral("type"), u8(ptr->getTypeName()));
        arr.append(ref);
    }
    return arr;
}

static QJsonObject ruleElementJson(RuleElement *re)
{
    QJsonObject o;
    if (!re)
        return o;
    o.insert(QStringLiteral("id"),
             u8(FWObjectDatabase::getStringId(re->getId())));
    o.insert(QStringLiteral("neg"), re->getNeg());
    o.insert(QStringLiteral("any"), re->isAny());
    o.insert(QStringLiteral("objects"), ruleElementRefs(re));
    return o;
}

static QJsonObject policyRuleJson(PolicyRule *rule)
{
    QJsonObject o;
    o.insert(QStringLiteral("id"),
             u8(FWObjectDatabase::getStringId(rule->getId())));
    o.insert(QStringLiteral("type"), QStringLiteral("PolicyRule"));
    o.insert(QStringLiteral("position"), rule->getPosition());
    o.insert(QStringLiteral("disabled"), rule->isDisabled());
    o.insert(QStringLiteral("action"), u8(rule->getActionAsString()));
    o.insert(QStringLiteral("direction"), u8(rule->getDirectionAsString()));
    o.insert(QStringLiteral("logging"), rule->getLogging());
    o.insert(QStringLiteral("comment"), u8(rule->getComment()));
    o.insert(QStringLiteral("group"), u8(rule->getRuleGroupName()));
    o.insert(QStringLiteral("src"), ruleElementJson(rule->getSrc()));
    o.insert(QStringLiteral("dst"), ruleElementJson(rule->getDst()));
    o.insert(QStringLiteral("srv"), ruleElementJson(rule->getSrv()));
    o.insert(QStringLiteral("itf"), ruleElementJson(rule->getItf()));
    o.insert(QStringLiteral("when"), ruleElementJson(rule->getWhen()));
    return o;
}

static QJsonObject natRuleJson(NATRule *rule)
{
    QJsonObject o;
    o.insert(QStringLiteral("id"),
             u8(FWObjectDatabase::getStringId(rule->getId())));
    o.insert(QStringLiteral("type"), QStringLiteral("NATRule"));
    o.insert(QStringLiteral("position"), rule->getPosition());
    o.insert(QStringLiteral("disabled"), rule->isDisabled());
    o.insert(QStringLiteral("action"), u8(rule->getActionAsString()));
    o.insert(QStringLiteral("rule_type"), u8(rule->getRuleTypeAsString()));
    o.insert(QStringLiteral("comment"), u8(rule->getComment()));
    o.insert(QStringLiteral("group"), u8(rule->getRuleGroupName()));
    o.insert(QStringLiteral("osrc"), ruleElementJson(rule->getOSrc()));
    o.insert(QStringLiteral("odst"), ruleElementJson(rule->getODst()));
    o.insert(QStringLiteral("osrv"), ruleElementJson(rule->getOSrv()));
    o.insert(QStringLiteral("tsrc"), ruleElementJson(rule->getTSrc()));
    o.insert(QStringLiteral("tdst"), ruleElementJson(rule->getTDst()));
    o.insert(QStringLiteral("tsrv"), ruleElementJson(rule->getTSrv()));
    return o;
}

static QJsonObject routingRuleJson(RoutingRule *rule)
{
    QJsonObject o;
    o.insert(QStringLiteral("id"),
             u8(FWObjectDatabase::getStringId(rule->getId())));
    o.insert(QStringLiteral("type"), QStringLiteral("RoutingRule"));
    o.insert(QStringLiteral("position"), rule->getPosition());
    o.insert(QStringLiteral("disabled"), rule->isDisabled());
    o.insert(QStringLiteral("metric"), rule->getMetric());
    o.insert(QStringLiteral("rule_type"), u8(rule->getRuleTypeAsString()));
    o.insert(QStringLiteral("comment"), u8(rule->getComment()));
    o.insert(QStringLiteral("rdst"), ruleElementJson(rule->getRDst()));
    o.insert(QStringLiteral("rgtw"), ruleElementJson(rule->getRGtw()));
    o.insert(QStringLiteral("ritf"), ruleElementJson(rule->getRItf()));
    return o;
}

static QJsonObject objectToJson(FWObject *obj, int depth, int max_depth)
{
    QJsonObject o;
    if (!obj)
        return o;

    o.insert(QStringLiteral("id"),
             u8(FWObjectDatabase::getStringId(obj->getId())));
    o.insert(QStringLiteral("name"), u8(obj->getName()));
    o.insert(QStringLiteral("type"), u8(obj->getTypeName()));
    o.insert(QStringLiteral("comment"), u8(obj->getComment()));
    o.insert(QStringLiteral("ro"), obj->isReadOnly());

    QJsonObject attrs = typedAttrs(obj);
    if (!attrs.isEmpty())
        o.insert(QStringLiteral("attrs"), attrs);

    list<FWObject *> children;
    for (FWObject::iterator i = obj->begin(); i != obj->end(); ++i)
        children.push_back(*i);
    o.insert(QStringLiteral("children_count"), (int)children.size());

    if (Firewall::cast(obj)) {
        Firewall *fw = Firewall::cast(obj);
        QJsonObject sets;
        if (fw->getPolicy())
            sets.insert(QStringLiteral("policy"),
                        u8(FWObjectDatabase::getStringId(fw->getPolicy()->getId())));
        if (fw->getNAT())
            sets.insert(QStringLiteral("nat"),
                        u8(FWObjectDatabase::getStringId(fw->getNAT()->getId())));
        if (fw->getRouting())
            sets.insert(QStringLiteral("routing"),
                        u8(FWObjectDatabase::getStringId(fw->getRouting()->getId())));
        o.insert(QStringLiteral("rulesets"), sets);
    }

    if (depth < max_depth && !children.empty()) {
        QJsonArray kids;
        for (list<FWObject *>::iterator it = children.begin();
             it != children.end(); ++it) {
            kids.append(objectToJson(*it, depth + 1, max_depth));
        }
        o.insert(QStringLiteral("children"), kids);
    }

    return o;
}

static FWObject *findByIdString(FWObject *root, const string &sid)
{
    if (!root)
        return 0;
    if (FWObjectDatabase::getStringId(root->getId()) == sid)
        return root;
    for (FWObject::iterator i = root->begin(); i != root->end(); ++i) {
        FWObject *f = findByIdString(*i, sid);
        if (f)
            return f;
    }
    return 0;
}

static void collectSearch(FWObject *root, const string &q, const string &type_filter,
                          QJsonArray &out, int limit)
{
    if (!root || (int)out.size() >= limit)
        return;
    string name = root->getName();
    string type = root->getTypeName();
    bool type_ok = type_filter.empty() || type == type_filter;
    bool name_ok = q.empty() ||
                   QString::fromUtf8(name.c_str()).contains(
                       QString::fromUtf8(q.c_str()), Qt::CaseInsensitive);
    if (type_ok && name_ok && !FWReference::cast(root) &&
        type != "FWObjectDatabase") {
        QJsonObject hit;
        hit.insert(QStringLiteral("id"),
                   u8(FWObjectDatabase::getStringId(root->getId())));
        hit.insert(QStringLiteral("name"), u8(name));
        hit.insert(QStringLiteral("type"), u8(type));
        hit.insert(QStringLiteral("comment"), u8(root->getComment()));
        out.append(hit);
    }
    for (FWObject::iterator i = root->begin(); i != root->end(); ++i)
        collectSearch(*i, q, type_filter, out, limit);
}

static bool isIntKey(const string &key)
{
    return key == "type" || key == "code" || key == "protocol_num" ||
           key == "metric";
}

static QJsonObject handle(const QJsonObject &req)
{
    const QString cmd = req.value(QStringLiteral("cmd")).toString();

    if (cmd == QStringLiteral("ping")) {
        QJsonObject o = okObj();
        o.insert(QStringLiteral("version"), QStringLiteral(VERSION));
        return o;
    }

    if (cmd == QStringLiteral("open")) {
        const QString path = req.value(QStringLiteral("path")).toString();
        const bool allow_upgrade =
            req.value(QStringLiteral("allow_upgrade")).toBool(false);
        if (path.isEmpty())
            return errObj(QStringLiteral("path required"));

        try {
            if (g_db) {
                delete g_db;
                g_db = 0;
            }
            g_db = new FWObjectDatabase();
            WebUpgradePredicate pred(allow_upgrade);
            g_db->load(path.toUtf8().constData(), &pred,
                       Constants::getDTDDirectory());
            g_path = path.toUtf8().constData();
            g_dirty = false;
            QJsonObject o = okObj();
            o.insert(QStringLiteral("path"), path);
            o.insert(QStringLiteral("root_id"),
                     u8(FWObjectDatabase::getStringId(g_db->getId())));
            return o;
        } catch (FWException &ex) {
            if (g_db) {
                delete g_db;
                g_db = 0;
            }
            return errObj(u8(ex.toString()));
        } catch (std::exception &ex) {
            if (g_db) {
                delete g_db;
                g_db = 0;
            }
            return errObj(QString::fromUtf8(ex.what()));
        }
    }

    if (cmd == QStringLiteral("tree")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        int max_depth = req.value(QStringLiteral("depth")).toInt(3);
        if (max_depth < 0)
            max_depth = 0;
        if (max_depth > 12)
            max_depth = 12;
        QJsonObject o = okObj();
        o.insert(QStringLiteral("dirty"), g_dirty);
        o.insert(QStringLiteral("path"), u8(g_path));
        o.insert(QStringLiteral("root"), objectToJson(g_db, 0, max_depth));
        return o;
    }

    if (cmd == QStringLiteral("get")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));
        QJsonObject o = okObj();
        o.insert(QStringLiteral("object"), objectToJson(obj, 0, 1));
        return o;
    }

    if (cmd == QStringLiteral("search")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string q =
            req.value(QStringLiteral("q")).toString().toUtf8().constData();
        const string type_filter =
            req.value(QStringLiteral("type")).toString().toUtf8().constData();
        int limit = req.value(QStringLiteral("limit")).toInt(100);
        if (limit < 1)
            limit = 1;
        if (limit > 500)
            limit = 500;
        QJsonArray hits;
        collectSearch(g_db, q, type_filter, hits, limit);
        QJsonObject o = okObj();
        o.insert(QStringLiteral("results"), hits);
        o.insert(QStringLiteral("count"), hits.size());
        return o;
    }

    if (cmd == QStringLiteral("ruleset")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));

        // Accept Firewall (use its Policy) or a RuleSet id directly.
        RuleSet *rs = RuleSet::cast(obj);
        if (!rs) {
            Firewall *fw = Firewall::cast(obj);
            if (!fw)
                return errObj(QStringLiteral("not a firewall or ruleset"));
            const QString which =
                req.value(QStringLiteral("which")).toString(QStringLiteral("policy"));
            if (which == QStringLiteral("nat"))
                rs = fw->getNAT();
            else if (which == QStringLiteral("routing"))
                rs = fw->getRouting();
            else
                rs = fw->getPolicy();
        }
        if (!rs)
            return errObj(QStringLiteral("ruleset missing"));

        QJsonArray rules;
        for (FWObject::iterator i = rs->begin(); i != rs->end(); ++i) {
            FWObject *child = *i;
            if (PolicyRule *pr = PolicyRule::cast(child))
                rules.append(policyRuleJson(pr));
            else if (NATRule *nr = NATRule::cast(child))
                rules.append(natRuleJson(nr));
            else if (RoutingRule *rr = RoutingRule::cast(child))
                rules.append(routingRuleJson(rr));
        }
        QJsonObject o = okObj();
        o.insert(QStringLiteral("ruleset_id"),
                 u8(FWObjectDatabase::getStringId(rs->getId())));
        o.insert(QStringLiteral("ruleset_type"), u8(rs->getTypeName()));
        o.insert(QStringLiteral("name"), u8(rs->getName()));
        o.insert(QStringLiteral("rules"), rules);
        return o;
    }

    if (cmd == QStringLiteral("update_rule")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        Rule *rule = Rule::cast(obj);
        if (!rule)
            return errObj(QStringLiteral("not a rule"));
        if (rule->isReadOnly())
            return errObj(QStringLiteral("object is read-only"));

        try {
            if (req.contains(QStringLiteral("disabled"))) {
                if (req.value(QStringLiteral("disabled")).toBool())
                    rule->disable();
                else
                    rule->enable();
            }
            if (req.contains(QStringLiteral("comment"))) {
                rule->setComment(
                    req.value(QStringLiteral("comment")).toString().toUtf8().constData());
            }
            if (PolicyRule *pr = PolicyRule::cast(rule)) {
                if (req.contains(QStringLiteral("action")))
                    pr->setAction(
                        req.value(QStringLiteral("action")).toString().toUtf8().constData());
                if (req.contains(QStringLiteral("direction")))
                    pr->setDirection(
                        req.value(QStringLiteral("direction")).toString().toUtf8().constData());
                if (req.contains(QStringLiteral("logging")))
                    pr->setLogging(req.value(QStringLiteral("logging")).toBool());
            } else if (NATRule *nr = NATRule::cast(rule)) {
                if (req.contains(QStringLiteral("action")))
                    nr->setAction(
                        req.value(QStringLiteral("action")).toString().toUtf8().constData());
            } else if (RoutingRule *rr = RoutingRule::cast(rule)) {
                if (req.contains(QStringLiteral("metric")))
                    rr->setMetric(req.value(QStringLiteral("metric")).toInt());
            }
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            if (PolicyRule *pr = PolicyRule::cast(rule))
                o.insert(QStringLiteral("rule"), policyRuleJson(pr));
            else if (NATRule *nr = NATRule::cast(rule))
                o.insert(QStringLiteral("rule"), natRuleJson(nr));
            else if (RoutingRule *rr = RoutingRule::cast(rule))
                o.insert(QStringLiteral("rule"), routingRuleJson(rr));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("update")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));
        if (obj->isReadOnly())
            return errObj(QStringLiteral("object is read-only"));

        try {
            if (req.contains(QStringLiteral("name"))) {
                obj->setName(
                    req.value(QStringLiteral("name")).toString().toUtf8().constData());
            }
            if (req.contains(QStringLiteral("comment"))) {
                obj->setComment(
                    req.value(QStringLiteral("comment")).toString().toUtf8().constData());
            }
            if (req.contains(QStringLiteral("attrs")) &&
                req.value(QStringLiteral("attrs")).isObject()) {
                QJsonObject attrs = req.value(QStringLiteral("attrs")).toObject();
                for (auto it = attrs.begin(); it != attrs.end(); ++it) {
                    const string key = it.key().toUtf8().constData();
                    if (isIntKey(key) && it.value().isDouble()) {
                        obj->setInt(key, it.value().toInt());
                    } else {
                        const string val = it.value().toVariant().toString().toUtf8().constData();
                        if (isIntKey(key))
                            obj->setInt(key, atoi(val.c_str()));
                        else
                            obj->setStr(key, val);
                    }
                }
            }
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("object"), objectToJson(obj, 0, 1));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("save")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        QString path = req.value(QStringLiteral("path")).toString();
        if (path.isEmpty())
            path = QString::fromUtf8(g_path.c_str());
        try {
            g_db->saveFile(path.toUtf8().constData());
            g_path = path.toUtf8().constData();
            g_dirty = false;
            QJsonObject o = okObj();
            o.insert(QStringLiteral("path"), path);
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("close")) {
        if (g_db) {
            delete g_db;
            g_db = 0;
        }
        g_path.clear();
        g_dirty = false;
        return okObj();
    }

    return errObj(QStringLiteral("unknown cmd: ") + cmd);
}

static void writeJson(QTextStream &out, const QJsonObject &obj)
{
    out << QString::fromUtf8(
               QJsonDocument(obj).toJson(QJsonDocument::Compact))
        << '\n';
    out.flush();
}

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);
    init(argv);

    try {
        new Resources(Constants::getResourcesFilePath());
    } catch (FWException &ex) {
        cerr << "fwbweb: Resources: " << ex.toString() << endl;
        return 2;
    }

    QTextStream in(stdin);
    QTextStream out(stdout);

    QJsonObject ready = okObj();
    ready.insert(QStringLiteral("event"), QStringLiteral("ready"));
    ready.insert(QStringLiteral("version"), QStringLiteral(VERSION));
    writeJson(out, ready);

    while (!in.atEnd()) {
        const QString line = in.readLine();
        if (line.isNull())
            break;
        if (line.trimmed().isEmpty())
            continue;

        QJsonParseError pe;
        QJsonDocument doc = QJsonDocument::fromJson(line.toUtf8(), &pe);
        QJsonObject resp;
        if (pe.error != QJsonParseError::NoError || !doc.isObject()) {
            resp = errObj(QStringLiteral("invalid JSON: ") + pe.errorString());
        } else {
            const QJsonObject req = doc.object();
            if (req.value(QStringLiteral("cmd")).toString() ==
                QStringLiteral("quit")) {
                writeJson(out, okObj());
                break;
            }
            resp = handle(req);
        }
        writeJson(out, resp);
    }

    if (g_db) {
        delete g_db;
        g_db = 0;
    }
    return 0;
}
