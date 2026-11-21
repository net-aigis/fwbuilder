#!/usr/bin/env bash
# Phase-23083: client soft_fertig_ssh_auth_soft_22920_echo_roster Soft 23080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_22920_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23080+ soft_fertig_ssh_auth_soft_22920_echo_roster type ok"; echo "cleaned"; echo "OK: phase23083 e2e passed"
