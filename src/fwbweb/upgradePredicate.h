#ifndef FWBWEB_UPGRADE_PREDICATE_H
#define FWBWEB_UPGRADE_PREDICATE_H

#include "fwbuilder/XMLTools.h"

/**
 * Phase-1 WebUI default: do not silently upgrade .fwb files unless the
 * caller sets allow_upgrade. Matches cautious fwbedit use for shared files.
 */
class WebUpgradePredicate: public libfwbuilder::XMLTools::UpgradePredicate
{
    bool allow;
public:
    explicit WebUpgradePredicate(bool allow_upgrade = false) : allow(allow_upgrade) {}
    virtual bool operator()(const std::string &) const { return allow; }
};

#endif
