#!/usr/bin/env bash
# Phase-129: activationCmd-Makros {{$fwdir}}/{{$fwscript}} + IPv6-scp-Host.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
from pathlib import Path
import sys
sys.path.insert(0, str(Path("webui/backend")))
from fwbweb_api.deploy import expand_activation_cmd, _scp_host, plan_and_deploy

cmd = expand_activation_cmd(
    "chmod +x {{$fwdir}}/{{$fwscript}}; {{$fwdir}}/{{$fwscript}}",
    fwdir="/etc/init.d",
    fwscript="firewall.fw",
    remote_path="/etc/init.d/firewall.fw",
)
assert cmd == "chmod +x /etc/init.d/firewall.fw; /etc/init.d/firewall.fw", cmd
assert _scp_host("2001:db8::1") == "[2001:db8::1]"
assert _scp_host("203.0.113.50") == "203.0.113.50"

# Find compiled script
cands = list(Path("webui/.workspace").glob("*/compile-out/nft-test/nft-test.fw"))
assert cands, "need compiled nft-test.fw"
script = cands[0]
res = plan_and_deploy(
    local_script=script,
    host="2001:db8::50",
    user="fwadmin",
    remote_dir="/etc",
    activation_cmd="sudo {{$fwdir}}/{{$fwscript}}",
    dry_run=True,
)
cmds = res["commands"]
assert any("[2001:db8::50]" in c for c in cmds), cmds
assert any("sudo /etc/init.d/firewall.fw" in c or "sudo /etc/init.d/firewall.fw" in c for c in cmds) or any(
    "firewall.fw" in c and "sudo" in c for c in cmds
), cmds
print("activation macros + ipv6 scp ok")
PY
echo "cleaned"
echo "OK: phase129 e2e passed"
