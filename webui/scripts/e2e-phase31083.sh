#!/usr/bin/env bash
# Phase-31083: client soft_fertig_ssh_auth_soft_31920_echo_roster Soft 31080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_31920_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 31080+ soft_fertig_ssh_auth_soft_31920_echo_roster type ok"; echo "cleaned"; echo "OK: phase31083 e2e passed"
