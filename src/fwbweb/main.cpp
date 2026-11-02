/*
 * fwbweb — JSON Lines bridge for the Firewall Builder WebUI.
 *
 * One JSON request per stdin line; one JSON response per stdout line.
 * Project load/save/tree walks use libfwbuilder only.
 */

#include "../../config.h"
#include "fwbuilder/libfwbuilder-config.h"
#include "fwbuilder/Constants.h"
#include "fwbuilder/Resources.h"
#include "fwbuilder/FWObjectDatabase.h"
#include "fwbuilder/FWObject.h"
#include "fwbuilder/FWException.h"

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

    QJsonObject attrs;
    static const char *keys[] = {
        "address", "netmask", "dnsname", "run_time", "platform", "host_OS",
        "protocol", "src_range_start", "src_range_end",
        "dst_range_start", "dst_range_end", "code", "color",
        0
    };
    for (int k = 0; keys[k]; ++k) {
        try {
            const string &v = obj->getStr(keys[k]);
            if (!v.empty())
                attrs.insert(QString::fromUtf8(keys[k]), u8(v));
        } catch (...) {
        }
    }
    if (!attrs.isEmpty())
        o.insert(QStringLiteral("attrs"), attrs);

    list<FWObject *> children;
    for (FWObject::iterator i = obj->begin(); i != obj->end(); ++i)
        children.push_back(*i);
    o.insert(QStringLiteral("children_count"), (int)children.size());

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
                    const string val = it.value().toString().toUtf8().constData();
                    obj->setStr(key, val);
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
