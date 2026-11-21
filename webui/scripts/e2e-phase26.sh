#!/usr/bin/env bash
# Phase-26: new blank project, save-as, DNSName/AddressRange, bulk disable.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18116}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e26-$$"
mkdir -p "$TMP"

export FWBWEB_BRIDGE="$BRIDGE"
export FWBWEB_API_TOKEN="$TOKEN"
export FWBWEB_WORKSPACE="$ROOT/webui/.workspace"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"

source "$API_DIR/.venv/bin/activate"
cd "$API_DIR"
uvicorn fwbweb_api.main:app --host 127.0.0.1 --port "$PORT" >"$TMP/api.log" 2>&1 &
API_PID=$!
cleanup() { kill "$API_PID" 2>/dev/null || true; rm -rf "$TMP"; }
trap cleanup EXIT

for _ in $(seq 1 50); do
  curl -sf "http://127.0.0.1:$PORT/api/v1/health" >/dev/null && break
  sleep 0.2
done
auth=(-H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json")

python3 - <<PY
import json, urllib.request, urllib.error, os, shutil
from pathlib import Path

H={"Authorization":"Bearer $TOKEN","Content-Type":"application/json"}
base="http://127.0.0.1:$PORT/api/v1/projects"
tmp=Path("$TMP")

def call(method, path, body=None):
    data=None if body is None else json.dumps(body).encode()
    req=urllib.request.Request(base+path, data=data, method=method, headers=H)
    try:
        with urllib.request.urlopen(req) as resp:
            raw=resp.read()
            if not raw:
                return {"_status": resp.status}
            return json.loads(raw)
    except urllib.error.HTTPError as e:
        detail=e.read().decode()
        raise AssertionError(f"{method} {path} -> {e.code}: {detail}") from e

# --- new blank project ---
opened=call("POST", "/new", {"name": "webui-e2e-blank.fwb", "library_name": "User"})
sid=opened["session_id"]
print("new session", sid, "path", opened.get("path"))
assert opened.get("work_path"), opened
tree=call("GET", f"/{sid}/tree?depth=2")
root=tree["root"]
assert root.get("type")=="FWObjectDatabase", root
kids=root.get("children") or []
lib_names={c["name"] for c in kids}
print("root libs", sorted(lib_names))
assert "Standard" in lib_names, lib_names
assert "User" in lib_names, lib_names
user=[c for c in kids if c["name"]=="User"][0]
ufull=call("GET", f"/{sid}/objects/{user['id']}")
ufolders={c["name"] for c in (ufull.get("children") or [])}
print("user folders", sorted(ufolders))
assert {"Objects","Services","Firewalls","Clusters","Time"} <= ufolders, ufolders

# create AddressRange + DNSName under User/Objects
objs=[c for c in (ufull.get("children") or []) if c["name"]=="Objects"][0]["id"]
# Objects may be a group with nested Addresses / DNS Names — create under Objects group
arange=call("POST", f"/{sid}/objects", {
  "parent_id": objs,
  "type": "AddressRange",
  "name": "webui-e2e-range",
  "attrs": {"start_address": "10.9.0.1", "end_address": "10.9.0.50"},
})
a=arange.get("attrs") or {}
print("range", a)
assert a.get("start_address")=="10.9.0.1", a
assert a.get("end_address")=="10.9.0.50", a

dns=call("POST", f"/{sid}/objects", {
  "parent_id": objs,
  "type": "DNSName",
  "name": "webui-e2e-dns",
  "attrs": {"dnsname": "example.test", "run_time": "True"},
})
d=dns.get("attrs") or {}
print("dns", d)
assert d.get("dnsname")=="example.test", d
assert str(d.get("run_time")).lower() in ("true","1"), d

# save-as
save_as=str(tmp/"webui-e2e-saved.fwb")
saved=call("POST", f"/{sid}/save", {"save_as": save_as})
print("save_as", saved)
assert Path(save_as).is_file(), save_as
assert saved.get("source_path")==str(Path(save_as).resolve()) or Path(saved.get("source_path","")).name=="webui-e2e-saved.fwb", saved
call("POST", f"/{sid}/close")

# --- bulk disable on sample ---
opened=call("POST", "/open", {"path": "$FIX", "copy_to_workspace": True})
sid=opened["session_id"]
FW="id2679X30989"
rules=call("GET", f"/{sid}/rulesets/{FW}?which=policy")["rules"]
assert len(rules)>=2, len(rules)
r0, r1 = rules[0], rules[1]
# enable both first
call("PATCH", f"/{sid}/rules/{r0['id']}", {"disabled": False})
call("PATCH", f"/{sid}/rules/{r1['id']}", {"disabled": False})
call("PATCH", f"/{sid}/rules/{r0['id']}", {"disabled": True})
call("PATCH", f"/{sid}/rules/{r1['id']}", {"disabled": True})
after=call("GET", f"/{sid}/rulesets/{FW}?which=policy")["rules"]
by={r["id"]: r for r in after}
print("bulk disabled", by[r0["id"]]["disabled"], by[r1["id"]]["disabled"])
assert by[r0["id"]]["disabled"] is True
assert by[r1["id"]]["disabled"] is True
call("PATCH", f"/{sid}/rules/{r0['id']}", {"disabled": False})
call("PATCH", f"/{sid}/rules/{r1['id']}", {"disabled": False})
call("POST", f"/{sid}/close")
print("cleaned")
PY

echo "OK: phase26 e2e passed"
