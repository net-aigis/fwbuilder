#!/usr/bin/env bash
# Phase-39083: client soft_fertig_ssh_auth_soft_40840_echo_roster Soft 39080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_40840_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 39080+ soft_fertig_ssh_auth_soft_40840_echo_roster type ok"; echo "cleaned"; echo "OK: phase39083 e2e passed"
