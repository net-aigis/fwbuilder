#!/usr/bin/env bash
# Phase-261: expect plan includes reg_user + safety_net_acl previews.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'has_reg_user' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'has_safety_net_acl' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'related_names' webui/backend/fwbweb_api/configlets.py
grep -Fq 'safety_net_acl' webui/backend/fwbweb_api/configlets.py
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.expect_installer import expect_install_plan
p=expect_install_plan("ios")
ids=[s["id"] for s in p["steps"]]
assert "reg_user" in ids, ids
assert "safety_net_acl" in ids, ids
assert p.get("has_reg_user") is True
assert p.get("has_safety_net_acl") is True
safety=next(s for s in p["steps"] if s["id"]=="safety_net_acl")
assert safety.get("preview"), "safety preview empty"
print("expect plan extras ok", ids)
print("cleaned")
PY
echo "OK: phase261 e2e passed"
