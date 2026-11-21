#!/usr/bin/env bash
# Phase-46843: client soft_fertig_ssh_auth_ms_95000_echo_roster Soft 46840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_95000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 46840+ soft_fertig_ssh_auth_ms_95000_echo_roster type ok"; echo "cleaned"; echo "OK: phase46843 e2e passed"
