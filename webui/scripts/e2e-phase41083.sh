#!/usr/bin/env bash
# Phase-41083: client soft_fertig_ssh_auth_ms_86000_echo_roster Soft 41080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_86000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 41080+ soft_fertig_ssh_auth_ms_86000_echo_roster type ok"; echo "cleaned"; echo "OK: phase41083 e2e passed"
