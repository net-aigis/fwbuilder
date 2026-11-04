#!/usr/bin/env bash
# Phase-417: iptables option_enable for LOG/ULOG fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api.platforms import option_schema
s=option_schema("iptables","linux24")
rules=s.get("option_enable") or []
assert any(r.get("target")=="ulog_cprange" for r in rules), rules
assert any(r.get("target")=="log_tcp_seq" for r in rules), rules
print("ipt option_enable ok", len(rules))
PY
echo "cleaned"
echo "OK: phase417 e2e passed"
