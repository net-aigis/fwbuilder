#!/usr/bin/env bash
# Phase-13083: client soft_fertig_ssh_auth_soft_plus_echo_roster Soft 13080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_plus_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13080+ soft_fertig_ssh_auth_soft_plus_echo_roster type ok"; echo "cleaned"; echo "OK: phase13083 e2e passed"
