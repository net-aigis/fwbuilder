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
#include "fwbuilder/Address.h"
#include "fwbuilder/AddressRange.h"
#include "fwbuilder/AddressTable.h"
#include "fwbuilder/CustomService.h"
#include "fwbuilder/DNSName.h"
#include "fwbuilder/Firewall.h"
#include "fwbuilder/Host.h"
#include "fwbuilder/Interface.h"
#include "fwbuilder/IPv4.h"
#include "fwbuilder/IPv6.h"
#include "fwbuilder/physAddress.h"
#include "fwbuilder/TagService.h"
#include "fwbuilder/UserService.h"
#include "fwbuilder/Management.h"
#include "fwbuilder/FWOptions.h"
#include "fwbuilder/InetAddr.h"
#include "fwbuilder/IntervalGroup.h"
#include "fwbuilder/Library.h"
#include "fwbuilder/Network.h"
#include "fwbuilder/NetworkIPv6.h"
#include "fwbuilder/ObjectGroup.h"
#include "fwbuilder/Policy.h"
#include "fwbuilder/NAT.h"
#include "fwbuilder/Routing.h"
#include "fwbuilder/Rule.h"
#include "fwbuilder/RuleElement.h"
#include "fwbuilder/RuleSet.h"
#include "fwbuilder/ServiceGroup.h"

#include "commoninit.h"
#include "upgradePredicate.h"

#include <QCoreApplication>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QTextStream>

#include <iostream>
#include <list>
#include <set>
#include <string>
#include <cctype>

using namespace libfwbuilder;
using namespace std;

static FWObjectDatabase *g_db = 0;
static string g_path;
static bool g_dirty = false;

static bool isIntKey(const string &key);
static bool isMetaAttrKey(const string &key);

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
        "platform", "host_OS", "protocol", "src_range_start", "src_range_end",
        "dst_range_start", "dst_range_end", "code", "color", "version",
        "path", "iface_type", "days_of_week", "run_time", "label",
        "filename", "tagcode", "userid",
        0
    };
    for (int k = 0; str_keys[k]; ++k)
        putStrAttr(attrs, obj, str_keys[k]);

    const string t = obj->getTypeName();
    if (Interface *iface = Interface::cast(obj)) {
        physAddress *pa = iface->getPhysicalAddress();
        attrs.insert(QStringLiteral("phys_address"),
                     pa ? u8(pa->getPhysAddress()) : QString());
        attrs.insert(QStringLiteral("management"),
                     iface->isManagement() ? QStringLiteral("True")
                                           : QStringLiteral("False"));
        attrs.insert(QStringLiteral("dyn"),
                     iface->isDyn() ? QStringLiteral("True") : QStringLiteral("False"));
        attrs.insert(QStringLiteral("unnumbered"),
                     iface->isUnnumbered() ? QStringLiteral("True")
                                          : QStringLiteral("False"));
        attrs.insert(QStringLiteral("security_level"), iface->getSecurityLevel());
    }
    if (AddressRange *ar = AddressRange::cast(obj)) {
        attrs.insert(QStringLiteral("start_address"), u8(ar->getRangeStart().toString()));
        attrs.insert(QStringLiteral("end_address"), u8(ar->getRangeEnd().toString()));
    } else if (Address *addr = Address::cast(obj)) {
        // Network / IPv4 / IPv6 / NetworkIPv6 — real InetAddr fields, not setStr map.
        if (addr->getAddressPtr())
            attrs.insert(QStringLiteral("address"), u8(addr->getAddressPtr()->toString()));
        if (addr->getNetmaskPtr())
            attrs.insert(QStringLiteral("netmask"), u8(addr->getNetmaskPtr()->toString()));
    }
    if (DNSName *dns = DNSName::cast(obj)) {
        attrs.insert(QStringLiteral("dnsname"), u8(dns->getSourceName()));
        attrs.insert(QStringLiteral("run_time"),
                     dns->isRunTime() ? QStringLiteral("True") : QStringLiteral("False"));
    }
    if (AddressTable *at = AddressTable::cast(obj)) {
        attrs.insert(QStringLiteral("filename"), u8(at->getSourceName()));
        attrs.insert(QStringLiteral("run_time"),
                     at->isRunTime() ? QStringLiteral("True") : QStringLiteral("False"));
    }
    if (TagService *ts = TagService::cast(obj))
        attrs.insert(QStringLiteral("tagcode"), u8(ts->getCode()));
    if (UserService *us = UserService::cast(obj))
        attrs.insert(QStringLiteral("userid"), u8(us->getUserId()));
    if (CustomService *cs = CustomService::cast(obj)) {
        attrs.insert(QStringLiteral("protocol"), u8(cs->getProtocol()));
        attrs.insert(QStringLiteral("address_family"),
                     cs->getAddressFamily() == AF_INET6 ? QStringLiteral("inet6")
                                                       : QStringLiteral("inet"));
    }
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
    if (t == "Interval") {
        putIntAttr(attrs, obj, "from_minute");
        putIntAttr(attrs, obj, "from_hour");
        putIntAttr(attrs, obj, "from_day");
        putIntAttr(attrs, obj, "from_month");
        putIntAttr(attrs, obj, "from_year");
        putIntAttr(attrs, obj, "to_minute");
        putIntAttr(attrs, obj, "to_hour");
        putIntAttr(attrs, obj, "to_day");
        putIntAttr(attrs, obj, "to_month");
        putIntAttr(attrs, obj, "to_year");
        putStrAttr(attrs, obj, "days_of_week");
    }
    if (t == "Firewall" || t == "Cluster" || t == "Host") {
        putStrAttr(attrs, obj, "platform");
        putStrAttr(attrs, obj, "host_OS");
        putStrAttr(attrs, obj, "version");
    }
    if (t == "Interface") {
        const FWObject *parent_host = Host::getParentHost(obj);
        if (parent_host) {
            if (!attrs.contains(QStringLiteral("platform")))
                putStrAttr(attrs, const_cast<FWObject *>(parent_host), "platform");
            if (!attrs.contains(QStringLiteral("host_OS")))
                putStrAttr(attrs, const_cast<FWObject *>(parent_host), "host_OS");
        }
    }
    if (RuleSet *rs = RuleSet::cast(obj)) {
        attrs.insert(QStringLiteral("top"),
                     rs->isTop() ? QStringLiteral("True") : QStringLiteral("False"));
    }
    return attrs;
}

static bool parseBoolish(const string &val)
{
    string low;
    low.reserve(val.size());
    for (size_t i = 0; i < val.size(); ++i)
        low.push_back(static_cast<char>(tolower(static_cast<unsigned char>(val[i]))));
    return low == "true" || low == "1" || low == "yes";
}

static void populateLibraryFolders(FWObjectDatabase *db, FWObject *nlib)
{
    FWObject *o1 = db->create(ObjectGroup::TYPENAME);
    o1->setName("Objects");
    nlib->add(o1);

    FWObject *o2 = db->create(ObjectGroup::TYPENAME);
    o2->setName("Addresses");
    o1->add(o2);
    o2 = db->create(ObjectGroup::TYPENAME);
    o2->setName("DNS Names");
    o1->add(o2);
    o2 = db->create(ObjectGroup::TYPENAME);
    o2->setName("Address Tables");
    o1->add(o2);
    o2 = db->create(ObjectGroup::TYPENAME);
    o2->setName("Groups");
    o1->add(o2);
    o2 = db->create(ObjectGroup::TYPENAME);
    o2->setName("Hosts");
    o1->add(o2);
    o2 = db->create(ObjectGroup::TYPENAME);
    o2->setName("Networks");
    o1->add(o2);
    o2 = db->create(ObjectGroup::TYPENAME);
    o2->setName("Address Ranges");
    o1->add(o2);

    o1 = db->create(ServiceGroup::TYPENAME);
    o1->setName("Services");
    nlib->add(o1);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("Groups");
    o1->add(o2);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("ICMP");
    o1->add(o2);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("IP");
    o1->add(o2);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("TCP");
    o1->add(o2);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("UDP");
    o1->add(o2);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("Users");
    o1->add(o2);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("Custom");
    o1->add(o2);
    o2 = db->create(ServiceGroup::TYPENAME);
    o2->setName("TagServices");
    o1->add(o2);

    o1 = db->create(ObjectGroup::TYPENAME);
    o1->setName("Firewalls");
    nlib->add(o1);
    o1 = db->create(ObjectGroup::TYPENAME);
    o1->setName("Clusters");
    nlib->add(o1);
    o1 = db->create(IntervalGroup::TYPENAME);
    o1->setName("Time");
    nlib->add(o1);
}

static void applyObjectAttrs(FWObject *obj, const QJsonObject &attrs)
{
    for (auto it = attrs.begin(); it != attrs.end(); ++it) {
        const string key = it.key().toUtf8().constData();
        if (isMetaAttrKey(key))
            continue;
        const string val = it.value().toVariant().toString().toUtf8().constData();

        if (AddressRange *ar = AddressRange::cast(obj)) {
            if (key == "start_address" || key == "address") {
                ar->setRangeStart(InetAddr(val));
                continue;
            }
            if (key == "end_address") {
                ar->setRangeEnd(InetAddr(val));
                continue;
            }
        } else if (Address *addr = Address::cast(obj)) {
            const bool v6 = IPv6::isA(obj) || NetworkIPv6::isA(obj) ||
                            (addr->getAddressPtr() && addr->getAddressPtr()->isV6());
            const int af = v6 ? AF_INET6 : AF_INET;
            if (key == "address") {
                addr->setAddress(InetAddr(af, val));
                continue;
            }
            if (key == "netmask") {
                // Allow dotted/colon mask or prefix length.
                if (val.find('.') != string::npos || val.find(':') != string::npos) {
                    addr->setNetmask(InetAddr(af, val));
                } else if (addr->getAddressPtr()) {
                    addr->setNetmask(InetAddr(addr->getAddressPtr()->addressFamily(),
                                              atoi(val.c_str())));
                } else {
                    addr->setNetmask(InetAddr(af, atoi(val.c_str())));
                }
                continue;
            }
        }
        if (DNSName *dns = DNSName::cast(obj)) {
            if (key == "dnsname" || key == "dnsrec") {
                dns->setSourceName(val);
                continue;
            }
            if (key == "run_time") {
                dns->setRunTime(parseBoolish(val));
                continue;
            }
        }
        if (AddressTable *at = AddressTable::cast(obj)) {
            if (key == "filename" || key == "source_name") {
                at->setSourceName(val);
                continue;
            }
            if (key == "run_time") {
                at->setRunTime(parseBoolish(val));
                continue;
            }
        }
        if (TagService *ts = TagService::cast(obj)) {
            if (key == "tagcode" || key == "code") {
                ts->setCode(val);
                continue;
            }
        }
        if (UserService *us = UserService::cast(obj)) {
            if (key == "userid" || key == "user_id") {
                us->setUserId(val);
                continue;
            }
        }
        if (CustomService *cs = CustomService::cast(obj)) {
            if (key == "protocol") {
                cs->setProtocol(val);
                continue;
            }
            if (key == "address_family") {
                string low;
                for (size_t i = 0; i < val.size(); ++i)
                    low.push_back(static_cast<char>(
                        tolower(static_cast<unsigned char>(val[i]))));
                cs->setAddressFamily(low == "inet6" || low == "ipv6" || low == "6"
                                         ? AF_INET6
                                         : AF_INET);
                continue;
            }
            if (key == "code" || key.rfind("code_", 0) == 0) {
                string platform = "any";
                if (key.rfind("code_", 0) == 0 && key.size() > 5)
                    platform = key.substr(5);
                cs->setCodeForPlatform(platform, val);
                continue;
            }
        }
        if (Interface *iface = Interface::cast(obj)) {
            if (key == "phys_address" || key == "physAddress") {
                iface->setPhysicalAddress(val);
                continue;
            }
            if (key == "label") {
                iface->setLabel(val);
                continue;
            }
            if (key == "management") {
                iface->setManagement(parseBoolish(val));
                continue;
            }
            if (key == "dyn") {
                iface->setDyn(parseBoolish(val));
                continue;
            }
            if (key == "unnumbered" || key == "unnum") {
                iface->setUnnumbered(parseBoolish(val));
                continue;
            }
            if (key == "security_level" || key == "sec_level") {
                iface->setSecurityLevel(atoi(val.c_str()));
                continue;
            }
        }
        if (RuleSet *rs = RuleSet::cast(obj)) {
            if (key == "top") {
                rs->setTop(parseBoolish(val));
                continue;
            }
        }
        if (isIntKey(key)) {
            if (it.value().isDouble())
                obj->setInt(key, it.value().toInt());
            else
                obj->setInt(key, atoi(val.c_str()));
        } else {
            obj->setStr(key, val);
        }
    }
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

static void putBranchAttr(QJsonObject &o, Rule *rule)
{
    RuleSet *branch = rule->getBranch();
    if (branch) {
        o.insert(QStringLiteral("branch_id"),
                 u8(FWObjectDatabase::getStringId(branch->getId())));
        o.insert(QStringLiteral("branch_name"), u8(branch->getName()));
        o.insert(QStringLiteral("branch_type"), u8(branch->getTypeName()));
    } else {
        o.insert(QStringLiteral("branch_id"), QString());
        o.insert(QStringLiteral("branch_name"), QString());
        o.insert(QStringLiteral("branch_type"), QString());
    }
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
    putBranchAttr(o, rule);
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
    putBranchAttr(o, rule);
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
    if (FWObject *par = obj->getParent()) {
        o.insert(QStringLiteral("parent_id"),
                 u8(FWObjectDatabase::getStringId(par->getId())));
        o.insert(QStringLiteral("parent_type"), u8(par->getTypeName()));
    }

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

        QJsonArray rslist;
        for (FWObject::iterator i = fw->begin(); i != fw->end(); ++i) {
            RuleSet *rs = RuleSet::cast(*i);
            if (!rs)
                continue;
            QJsonObject entry;
            entry.insert(QStringLiteral("id"),
                         u8(FWObjectDatabase::getStringId(rs->getId())));
            entry.insert(QStringLiteral("name"), u8(rs->getName()));
            entry.insert(QStringLiteral("type"), u8(rs->getTypeName()));
            entry.insert(QStringLiteral("top"), rs->isTop());
            rslist.append(entry);
        }
        o.insert(QStringLiteral("ruleset_list"), rslist);
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
           key == "metric" || key == "from_minute" || key == "from_hour" ||
           key == "from_day" || key == "from_month" || key == "from_year" ||
           key == "to_minute" || key == "to_hour" || key == "to_day" ||
           key == "to_month" || key == "to_year" || key == "vlan_id" ||
           key == "enable_stp";
}

static QJsonObject ruleToJson(Rule *rule)
{
    if (PolicyRule *pr = PolicyRule::cast(rule))
        return policyRuleJson(pr);
    if (NATRule *nr = NATRule::cast(rule))
        return natRuleJson(nr);
    if (RoutingRule *rr = RoutingRule::cast(rule))
        return routingRuleJson(rr);
    return QJsonObject();
}

static RuleSet *resolveRuleSet(FWObject *obj, const QString &which)
{
    if (RuleSet *rs = RuleSet::cast(obj))
        return rs;
    Firewall *fw = Firewall::cast(obj);
    if (!fw)
        return 0;
    if (which == QStringLiteral("nat"))
        return fw->getNAT();
    if (which == QStringLiteral("routing"))
        return fw->getRouting();
    return fw->getPolicy();
}

static bool isMetaAttrKey(const string &key)
{
    return key == "id" || key == "name" || key == "comment" || key == "ro";
}

static QJsonObject optionsToJson(FWOptions *opt)
{
    QJsonObject o;
    if (!opt)
        return o;
    for (map<string, string>::const_iterator it = opt->dataBegin();
         it != opt->dataEnd(); ++it) {
        if (isMetaAttrKey(it->first))
            continue;
        o.insert(u8(it->first), u8(it->second));
    }
    return o;
}

static QJsonObject managementToJson(Management *mgmt)
{
    QJsonObject o;
    if (!mgmt)
        return o;
    try {
        o.insert(QStringLiteral("address"), u8(mgmt->getAddress().toString()));
    } catch (...) {
        o.insert(QStringLiteral("address"), QString());
    }
    PolicyInstallScript *pis = mgmt->getPolicyInstallScript();
    if (pis) {
        QJsonObject script;
        script.insert(QStringLiteral("enabled"), pis->isEnabled());
        script.insert(QStringLiteral("command"), u8(pis->getCommand()));
        script.insert(QStringLiteral("arguments"), u8(pis->getArguments()));
        o.insert(QStringLiteral("install_script"), script);
    }
    return o;
}

static RuleElement *ruleElementByName(Rule *rule, const QString &el)
{
    if (!rule)
        return 0;
    if (PolicyRule *pr = PolicyRule::cast(rule)) {
        if (el == QStringLiteral("src"))
            return pr->getSrc();
        if (el == QStringLiteral("dst"))
            return pr->getDst();
        if (el == QStringLiteral("srv"))
            return pr->getSrv();
        if (el == QStringLiteral("itf"))
            return pr->getItf();
        if (el == QStringLiteral("when"))
            return pr->getWhen();
    } else if (NATRule *nr = NATRule::cast(rule)) {
        if (el == QStringLiteral("osrc"))
            return nr->getOSrc();
        if (el == QStringLiteral("odst"))
            return nr->getODst();
        if (el == QStringLiteral("osrv"))
            return nr->getOSrv();
        if (el == QStringLiteral("tsrc"))
            return nr->getTSrc();
        if (el == QStringLiteral("tdst"))
            return nr->getTDst();
        if (el == QStringLiteral("tsrv"))
            return nr->getTSrv();
    } else if (RoutingRule *rr = RoutingRule::cast(rule)) {
        if (el == QStringLiteral("rdst"))
            return rr->getRDst();
        if (el == QStringLiteral("rgtw"))
            return rr->getRGtw();
        if (el == QStringLiteral("ritf"))
            return rr->getRItf();
    }
    return 0;
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

        const QString which =
            req.value(QStringLiteral("which")).toString(QStringLiteral("policy"));
        RuleSet *rs = resolveRuleSet(obj, which);
        if (!rs)
            return errObj(QStringLiteral("not a firewall or ruleset"));

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
            if (req.contains(QStringLiteral("group"))) {
                rule->setRuleGroupName(
                    req.value(QStringLiteral("group")).toString().toUtf8().constData());
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
            if (req.contains(QStringLiteral("branch_id"))) {
                const QString bid = req.value(QStringLiteral("branch_id")).toString();
                if (bid.isEmpty()) {
                    rule->setBranch(0);
                } else {
                    FWObject *bobj =
                        findByIdString(g_db, bid.toUtf8().constData());
                    RuleSet *rs = RuleSet::cast(bobj);
                    if (!rs)
                        return errObj(QStringLiteral("branch_id is not a ruleset"));
                    rule->setBranch(rs);
                }
            }
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("rule"), ruleToJson(rule));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("add_rule")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));
        const QString which =
            req.value(QStringLiteral("which")).toString(QStringLiteral("policy"));
        RuleSet *rs = resolveRuleSet(obj, which);
        if (!rs)
            return errObj(QStringLiteral("not a firewall or ruleset"));
        if (rs->isReadOnly())
            return errObj(QStringLiteral("object is read-only"));

        const QString where =
            req.value(QStringLiteral("where")).toString(QStringLiteral("bottom"));
        const int pos = req.value(QStringLiteral("position")).toInt(-1);
        Rule *created = 0;
        try {
            if (where == QStringLiteral("top"))
                created = rs->insertRuleAtTop();
            else if (where == QStringLiteral("before"))
                created = rs->insertRuleBefore(pos);
            else if (where == QStringLiteral("after"))
                created = rs->appendRuleAfter(pos);
            else
                created = rs->appendRuleAtBottom();
            if (!created)
                return errObj(QStringLiteral("failed to create rule"));
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("rule"), ruleToJson(created));
            o.insert(QStringLiteral("ruleset_id"),
                     u8(FWObjectDatabase::getStringId(rs->getId())));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("delete_rule")) {
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
        RuleSet *rs = RuleSet::cast(rule->getParent());
        if (!rs)
            return errObj(QStringLiteral("rule has no ruleset parent"));
        try {
            if (!rs->deleteRule(rule))
                return errObj(QStringLiteral("delete failed"));
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("ruleset_id"),
                     u8(FWObjectDatabase::getStringId(rs->getId())));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("move_rule")) {
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
        RuleSet *rs = RuleSet::cast(rule->getParent());
        if (!rs)
            return errObj(QStringLiteral("rule has no ruleset parent"));

        const QString dir =
            req.value(QStringLiteral("direction")).toString();
        const int to = req.value(QStringLiteral("to")).toInt(-1);
        const int n = rule->getPosition();
        bool ok = false;
        try {
            if (dir == QStringLiteral("up"))
                ok = rs->moveRuleUp(n);
            else if (dir == QStringLiteral("down"))
                ok = rs->moveRuleDown(n);
            else if (to >= 0)
                ok = rs->moveRule(n, to);
            else
                return errObj(QStringLiteral("direction or to required"));
            if (!ok)
                return errObj(QStringLiteral("move failed"));
            g_dirty = true;
            g_db->setDirty(true);
            // Rule object still valid; renumber updates position.
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("rule"), ruleToJson(rule));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("duplicate_rule")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        Rule *src = Rule::cast(obj);
        if (!src)
            return errObj(QStringLiteral("not a rule"));
        RuleSet *rs = RuleSet::cast(src->getParent());
        if (!rs)
            return errObj(QStringLiteral("rule has no ruleset parent"));
        if (rs->isReadOnly())
            return errObj(QStringLiteral("object is read-only"));
        try {
            Rule *created = rs->appendRuleAfter(src->getPosition());
            if (!created)
                return errObj(QStringLiteral("failed to create rule"));
            const int pos = created->getPosition();
            // Keep the new rule's id; copy content from source (desktop GUI pattern).
            created->duplicate(src);
            created->setPosition(pos);
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("rule"), ruleToJson(created));
            o.insert(QStringLiteral("source_id"),
                     u8(FWObjectDatabase::getStringId(src->getId())));
            o.insert(QStringLiteral("ruleset_id"),
                     u8(FWObjectDatabase::getStringId(rs->getId())));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("re_add_ref") ||
        cmd == QStringLiteral("re_remove_ref") ||
        cmd == QStringLiteral("re_set_any") ||
        cmd == QStringLiteral("re_set_neg")) {
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
        const QString el = req.value(QStringLiteral("element")).toString();
        RuleElement *re = ruleElementByName(rule, el);
        if (!re)
            return errObj(QStringLiteral("unknown rule element: ") + el);

        try {
            if (cmd == QStringLiteral("re_set_any")) {
                re->setAnyElement();
            } else if (cmd == QStringLiteral("re_set_neg")) {
                if (!req.contains(QStringLiteral("neg")))
                    return errObj(QStringLiteral("neg required"));
                re->setNeg(req.value(QStringLiteral("neg")).toBool());
            } else {
                const string oid =
                    req.value(QStringLiteral("object_id")).toString().toUtf8().constData();
                FWObject *target = findByIdString(g_db, oid);
                if (!target)
                    return errObj(QStringLiteral("object not found"));
                if (cmd == QStringLiteral("re_add_ref"))
                    re->addRef(target);
                else
                    re->removeRef(target);
            }
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("rule"), ruleToJson(rule));
            o.insert(QStringLiteral("element"), el);
            o.insert(QStringLiteral("rule_element"), ruleElementJson(re));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("options") || cmd == QStringLiteral("update_options")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));

        FWOptions *opt = 0;
        if (Firewall *fw = Firewall::cast(obj))
            opt = fw->getOptionsObject();
        else if (Interface *iface = Interface::cast(obj))
            opt = iface->getOptionsObject();
        else if (Rule *rule = Rule::cast(obj))
            opt = rule->getOptionsObject();
        else if (Host *host = Host::cast(obj))
            opt = host->getOptionsObject();
        else if (FWOptions *direct = FWOptions::cast(obj))
            opt = direct;
        if (!opt)
            return errObj(QStringLiteral("object has no options"));

        if (cmd == QStringLiteral("update_options")) {
            if (obj->isReadOnly() || opt->isReadOnly())
                return errObj(QStringLiteral("object is read-only"));
            if (!req.contains(QStringLiteral("options")) ||
                !req.value(QStringLiteral("options")).isObject())
                return errObj(QStringLiteral("options object required"));
            try {
                QJsonObject patch = req.value(QStringLiteral("options")).toObject();
                for (auto it = patch.begin(); it != patch.end(); ++it) {
                    const string key = it.key().toUtf8().constData();
                    if (isMetaAttrKey(key))
                        continue;
                    const string val =
                        it.value().toVariant().toString().toUtf8().constData();
                    opt->setStr(key, val);
                }
                g_dirty = true;
                g_db->setDirty(true);
            } catch (FWException &ex) {
                return errObj(u8(ex.toString()));
            }
        }

        QJsonObject o = okObj();
        o.insert(QStringLiteral("dirty"), g_dirty);
        o.insert(QStringLiteral("object_id"),
                 u8(FWObjectDatabase::getStringId(obj->getId())));
        o.insert(QStringLiteral("options_id"),
                 u8(FWObjectDatabase::getStringId(opt->getId())));
        o.insert(QStringLiteral("options"), optionsToJson(opt));
        if (Interface *iface = Interface::cast(obj)) {
            const FWObject *parent_host = Host::getParentHost(iface);
            if (parent_host) {
                o.insert(QStringLiteral("host_OS"),
                         u8(parent_host->getStr("host_OS")));
                o.insert(QStringLiteral("platform"),
                         u8(parent_host->getStr("platform")));
            }
        }
        return o;
    }

    if (cmd == QStringLiteral("management") ||
        cmd == QStringLiteral("update_management")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        Host *host = Host::cast(obj);
        if (!host)
            return errObj(QStringLiteral("not a host/firewall"));
        Management *mgmt = host->getManagementObject();
        if (!mgmt)
            return errObj(QStringLiteral("management object missing"));

        if (cmd == QStringLiteral("update_management")) {
            if (host->isReadOnly() || mgmt->isReadOnly())
                return errObj(QStringLiteral("object is read-only"));
            try {
                if (req.contains(QStringLiteral("address"))) {
                    const string addr =
                        req.value(QStringLiteral("address")).toString().toUtf8().constData();
                    mgmt->setAddress(InetAddr(addr));
                }
                if (req.contains(QStringLiteral("install_script")) &&
                    req.value(QStringLiteral("install_script")).isObject()) {
                    PolicyInstallScript *pis = mgmt->getPolicyInstallScript();
                    if (pis) {
                        QJsonObject script =
                            req.value(QStringLiteral("install_script")).toObject();
                        if (script.contains(QStringLiteral("enabled")))
                            pis->setEnabled(script.value(QStringLiteral("enabled")).toBool());
                        if (script.contains(QStringLiteral("command")))
                            pis->setCommand(
                                script.value(QStringLiteral("command"))
                                    .toString()
                                    .toUtf8()
                                    .constData());
                        if (script.contains(QStringLiteral("arguments")))
                            pis->setArguments(
                                script.value(QStringLiteral("arguments"))
                                    .toString()
                                    .toUtf8()
                                    .constData());
                    }
                }
                g_dirty = true;
                g_db->setDirty(true);
            } catch (FWException &ex) {
                return errObj(u8(ex.toString()));
            } catch (std::exception &ex) {
                return errObj(QString::fromUtf8(ex.what()));
            }
        }

        QJsonObject o = okObj();
        o.insert(QStringLiteral("dirty"), g_dirty);
        o.insert(QStringLiteral("object_id"),
                 u8(FWObjectDatabase::getStringId(host->getId())));
        o.insert(QStringLiteral("management"), managementToJson(mgmt));
        return o;
    }

    if (cmd == QStringLiteral("set_ro")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));
        if (obj == g_db)
            return errObj(QStringLiteral("cannot lock database root"));
        if (!req.contains(QStringLiteral("ro")))
            return errObj(QStringLiteral("ro required"));
        // System standard library stays locked.
        FWObject *lib = obj;
        while (lib && !Library::cast(lib))
            lib = lib->getParent();
        const bool unlocking = !req.value(QStringLiteral("ro")).toBool();
        if (unlocking && Library::cast(lib)) {
            const string lid = FWObjectDatabase::getStringId(lib->getId());
            const string lname = lib->getName();
            if (lname == "Standard" || lid.find("syslib") == 0 || lid.find("std") == 0)
                return errObj(QStringLiteral("cannot unlock Standard library objects"));
            if (lib->isReadOnly() && obj != lib)
                return errObj(QStringLiteral("cannot unlock object in read-only library"));
        }
        try {
            obj->setReadOnly(req.value(QStringLiteral("ro")).toBool());
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
                applyObjectAttrs(obj, req.value(QStringLiteral("attrs")).toObject());
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

    if (cmd == QStringLiteral("create")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string parent_sid =
            req.value(QStringLiteral("parent_id")).toString().toUtf8().constData();
        const string type_name =
            req.value(QStringLiteral("type")).toString().toUtf8().constData();
        const string name =
            req.value(QStringLiteral("name")).toString().toUtf8().constData();
        if (type_name.empty())
            return errObj(QStringLiteral("type required"));
        if (name.empty())
            return errObj(QStringLiteral("name required"));
        FWObject *parent = parent_sid.empty() ? (FWObject *)g_db
                                              : findByIdString(g_db, parent_sid);
        if (!parent)
            return errObj(QStringLiteral("parent not found"));
        if (parent->isReadOnly())
            return errObj(QStringLiteral("parent is read-only"));
        // Disallow creating under rulesets/rules via this generic API.
        if (RuleSet::cast(parent) || Rule::cast(parent) || RuleElement::cast(parent))
            return errObj(QStringLiteral("cannot create under ruleset/rule"));
        try {
            FWObject *child = g_db->create(type_name);
            if (!child)
                return errObj(QStringLiteral("unknown or unsupported type: ") +
                              QString::fromUtf8(type_name.c_str()));
            child->setName(name);
            if (Firewall *fw = Firewall::cast(child))
                fw->init(g_db);
            else if (Host *h = Host::cast(child))
                h->init(g_db);
            else if (Library::cast(child))
                populateLibraryFolders(g_db, child);
            else if (RuleSet *rs = RuleSet::cast(child)) {
                // Secondary rulesets under a firewall are not top by default.
                if (Firewall::cast(parent))
                    rs->setTop(false);
            }
            if (req.contains(QStringLiteral("comment"))) {
                child->setComment(
                    req.value(QStringLiteral("comment")).toString().toUtf8().constData());
            }
            if (req.contains(QStringLiteral("attrs")) &&
                req.value(QStringLiteral("attrs")).isObject()) {
                applyObjectAttrs(child, req.value(QStringLiteral("attrs")).toObject());
            }
            parent->add(child);
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("object"), objectToJson(child, 0, 1));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("delete")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));
        if (obj == g_db)
            return errObj(QStringLiteral("cannot delete database root"));
        if (obj->isReadOnly())
            return errObj(QStringLiteral("object is read-only"));
        if (Rule::cast(obj))
            return errObj(QStringLiteral("use delete_rule for rules"));
        FWObject *parent = obj->getParent();
        if (!parent)
            return errObj(QStringLiteral("object has no parent"));
        try {
            // remove() unrefs and deletes when last reference.
            parent->remove(obj, true);
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("parent_id"),
                     u8(FWObjectDatabase::getStringId(parent->getId())));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("reparent")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        const string parent_sid =
            req.value(QStringLiteral("parent_id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        FWObject *new_parent = findByIdString(g_db, parent_sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));
        if (!new_parent)
            return errObj(QStringLiteral("parent not found"));
        if (obj == g_db)
            return errObj(QStringLiteral("cannot reparent database root"));
        if (obj->isReadOnly())
            return errObj(QStringLiteral("object is read-only"));
        if (new_parent->isReadOnly())
            return errObj(QStringLiteral("parent is read-only"));
        if (Rule::cast(obj) || RuleSet::cast(obj) || RuleElement::cast(obj))
            return errObj(QStringLiteral("cannot reparent rules via this API"));
        if (RuleSet::cast(new_parent) || Rule::cast(new_parent) ||
            RuleElement::cast(new_parent))
            return errObj(QStringLiteral("cannot reparent under ruleset/rule"));
        // Prevent moving an object under itself / descendant.
        for (FWObject *p = new_parent; p; p = p->getParent()) {
            if (p == obj)
                return errObj(QStringLiteral("cannot reparent under itself"));
        }
        try {
            new_parent->reparent(obj, true);
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("object"), objectToJson(obj, 0, 1));
            o.insert(QStringLiteral("parent_id"),
                     u8(FWObjectDatabase::getStringId(new_parent->getId())));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("duplicate")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *src = findByIdString(g_db, sid);
        if (!src)
            return errObj(QStringLiteral("object not found"));
        if (src == g_db)
            return errObj(QStringLiteral("cannot duplicate database root"));
        if (Rule::cast(src) || RuleSet::cast(src) || RuleElement::cast(src))
            return errObj(QStringLiteral("cannot duplicate rules via this API"));
        string parent_sid =
            req.value(QStringLiteral("parent_id")).toString().toUtf8().constData();
        FWObject *parent = parent_sid.empty() ? src->getParent()
                                              : findByIdString(g_db, parent_sid);
        if (!parent)
            return errObj(QStringLiteral("parent not found"));
        if (parent->isReadOnly())
            return errObj(QStringLiteral("parent is read-only"));
        try {
            FWObject *copy = g_db->create(src->getTypeName());
            if (!copy)
                return errObj(QStringLiteral("cannot create copy"));
            // preserve_id=true keeps the new object's freshly issued id
            // (false would overwrite it with the source id).
            copy->duplicate(src, true);
            QString new_name = req.value(QStringLiteral("name")).toString();
            if (new_name.isEmpty())
                new_name = u8(src->getName()) + QStringLiteral(" Copy");
            copy->setName(new_name.toUtf8().constData());
            if (Interface::cast(copy)) {
                Interface::cast(copy)->setManagement(false);
            }
            parent->add(copy);
            g_dirty = true;
            g_db->setDirty(true);
            QJsonObject o = okObj();
            o.insert(QStringLiteral("dirty"), true);
            o.insert(QStringLiteral("object"), objectToJson(copy, 0, 1));
            o.insert(QStringLiteral("source_id"),
                     u8(FWObjectDatabase::getStringId(src->getId())));
            return o;
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
    }

    if (cmd == QStringLiteral("members") || cmd == QStringLiteral("add_member") ||
        cmd == QStringLiteral("remove_member")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *group = findByIdString(g_db, sid);
        if (!group)
            return errObj(QStringLiteral("object not found"));
        if (cmd == QStringLiteral("add_member") ||
            cmd == QStringLiteral("remove_member")) {
            if (group->isReadOnly())
                return errObj(QStringLiteral("object is read-only"));
            const string mid =
                req.value(QStringLiteral("member_id")).toString().toUtf8().constData();
            FWObject *member = findByIdString(g_db, mid);
            if (!member)
                return errObj(QStringLiteral("member not found"));
            if (member == group)
                return errObj(QStringLiteral("cannot add group to itself"));
            try {
                if (cmd == QStringLiteral("add_member")) {
                    if (group->hasRef(member))
                        return errObj(QStringLiteral("already a member"));
                    group->addRef(member);
                } else {
                    group->removeRef(member);
                }
                g_dirty = true;
                g_db->setDirty(true);
            } catch (FWException &ex) {
                return errObj(u8(ex.toString()));
            }
        }
        QJsonArray members;
        for (FWObject::iterator i = group->begin(); i != group->end(); ++i) {
            FWObject *child = *i;
            FWObject *ptr = FWReference::getObject(child);
            if (!ptr)
                continue;
            // Skip nested InterfaceOptions / options-like children that are not refs
            if (!FWReference::cast(child) && child == ptr)
                continue;
            QJsonObject row;
            row.insert(QStringLiteral("id"),
                       u8(FWObjectDatabase::getStringId(ptr->getId())));
            row.insert(QStringLiteral("name"), u8(ptr->getName()));
            row.insert(QStringLiteral("type"), u8(ptr->getTypeName()));
            members.append(row);
        }
        QJsonObject o = okObj();
        o.insert(QStringLiteral("dirty"), g_dirty);
        o.insert(QStringLiteral("object_id"),
                 u8(FWObjectDatabase::getStringId(group->getId())));
        o.insert(QStringLiteral("count"), members.size());
        o.insert(QStringLiteral("members"), members);
        return o;
    }

    if (cmd == QStringLiteral("where_used")) {
        if (!g_db)
            return errObj(QStringLiteral("no project open"));
        const string sid =
            req.value(QStringLiteral("id")).toString().toUtf8().constData();
        FWObject *obj = findByIdString(g_db, sid);
        if (!obj)
            return errObj(QStringLiteral("object not found"));
        set<FWObject *> refs;
        try {
            g_db->findWhereObjectIsUsed(obj, g_db, refs);
        } catch (FWException &ex) {
            return errObj(u8(ex.toString()));
        }
        QJsonArray uses;
        set<int> seen_ids;
        for (set<FWObject *>::const_iterator it = refs.begin();
             it != refs.end(); ++it) {
            FWObject *hit = *it;
            if (!hit)
                continue;
            FWObject *display = hit;
            if (FWReference::cast(hit) && hit->getParent())
                display = hit->getParent();
            // Walk up from rule elements to the rule for clearer UI.
            FWObject *ctx = display;
            while (ctx && RuleElement::cast(ctx))
                ctx = ctx->getParent();
            if (ctx)
                display = ctx;
            if (seen_ids.count(display->getId()))
                continue;
            seen_ids.insert(display->getId());
            QJsonObject row;
            row.insert(QStringLiteral("id"),
                       u8(FWObjectDatabase::getStringId(display->getId())));
            row.insert(QStringLiteral("name"), u8(display->getName()));
            row.insert(QStringLiteral("type"), u8(display->getTypeName()));
            if (display->getParent()) {
                row.insert(QStringLiteral("parent_id"),
                           u8(FWObjectDatabase::getStringId(
                               display->getParent()->getId())));
                row.insert(QStringLiteral("parent_name"),
                           u8(display->getParent()->getName()));
                row.insert(QStringLiteral("parent_type"),
                           u8(display->getParent()->getTypeName()));
            }
            uses.append(row);
        }
        QJsonObject o = okObj();
        o.insert(QStringLiteral("object_id"),
                 u8(FWObjectDatabase::getStringId(obj->getId())));
        o.insert(QStringLiteral("count"), uses.size());
        o.insert(QStringLiteral("uses"), uses);
        return o;
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
