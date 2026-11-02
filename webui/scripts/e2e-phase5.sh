#!/usr/bin/env bash
# Phase-5 local E2E: platform catalog + option schema from resources XML.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

BRIDGE="$ROOT/webui/bin/fwbweb"
API_DIR="$ROOT/webui/backend"
FIX="$ROOT/webui/fixtures/sample-v24.fwb"
TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
PORT="${FWBWEB_PORT:-18093}"
TMP="${TMPDIR:-/tmp}/fwbweb-e2e5-$$"
mkdir -p "$TMP"

export FWBWEB_BRIDGE="$BRIDGE"
export FWBWEB_API_TOKEN="$TOKEN"
export FWBWEB_WORKSPACE="$ROOT/webui/.workspace"
export FWBUILDER_RES_DIR="$ROOT/webui/.res"

# Ensure resources exist for schema parsing
if [[ ! -d "$ROOT/webui/.res/platform" ]]; then
  mkdir -p "$ROOT/webui/.res"
  cp -a "$ROOT/src/res/platform" "$ROOT/src/res/os" "$ROOT/webui/.res/"
fi

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

echo "== platforms catalog =="
curl -sf "${auth[@]}" "http://127.0.0.1:$PORT/api/v1/platforms" >"$TMP/plats.json"
python3 - <<PY
import json
d=json.load(open("$TMP/plats.json"))
names={p["name"] for p in d["platforms"]}
print("platforms", sorted(names))
assert "nftables" in names and "iptables" in names and "pf" in names, names
nft=next(p for p in d["platforms"] if p["name"]=="nftables")
assert nft["compiler"]=="fwb_nft", nft
assert "linux24" in nft["supported_os"], nft
print("oses", len(d["oses"]))
assert len(d["oses"])>=5
PY

echo "== option schema nftables/linux24 =="
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/option-schema?platform=nftables&host_os=linux24" \
  >"$TMP/schema.json"
python3 - <<PY
import json
d=json.load(open("$TMP/schema.json"))
assert d["compiler"]=="fwb_nft", d
assert d["defaults"].get("configure_interfaces"), d["defaults"]
ids={g["id"] for g in d["groups"]}
assert {"installer","platform","os","scripts"} <= ids, ids
print("featured", len(d["featured_keys"]), "groups", ids)
PY

echo "== schema guides firewall options UI =="
curl -sf "${auth[@]}" -d "{\"path\":\"$FIX\",\"copy_to_workspace\":true}" \
  "http://127.0.0.1:$PORT/api/v1/projects/open" >"$TMP/open.json"
SID=$(python3 -c 'import json; print(json.load(open("'"$TMP"'/open.json"))["session_id"])')
FW=id2679X30989
curl -sf "${auth[@]}" \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/objects/$FW/options" >"$TMP/opts.json"
python3 - <<PY
import json
schema=json.load(open("$TMP/schema.json"))
opts=json.load(open("$TMP/opts.json"))["options"]
# platform default keys should largely exist on the live FirewallOptions bag
hits=sum(1 for k in schema["defaults"] if k in opts)
print("default keys present", hits, "/", len(schema["defaults"]))
assert hits >= max(3, len(schema["defaults"])//2), (hits, schema["defaults"])
PY

curl -sf -o /dev/null -w "%{http_code}\n" "${auth[@]}" -X POST \
  "http://127.0.0.1:$PORT/api/v1/projects/$SID/close" | grep -q 204

echo "OK: phase5 e2e passed"
