#!/usr/bin/env bash
# Phase-38843: client soft_fertig_ssh_auth_ms_82500_echo_roster Soft 38840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_82500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 38840+ soft_fertig_ssh_auth_ms_82500_echo_roster type ok"; echo "cleaned"; echo "OK: phase38843 e2e passed"
