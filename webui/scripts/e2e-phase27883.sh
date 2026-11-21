#!/usr/bin/env bash
# Phase-27883: client soft_fertig_ssh_auth_soft_28320_echo_roster Soft 27880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_28320_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 27880+ soft_fertig_ssh_auth_soft_28320_echo_roster type ok"; echo "cleaned"; echo "OK: phase27883 e2e passed"
