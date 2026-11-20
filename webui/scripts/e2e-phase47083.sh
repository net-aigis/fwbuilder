#!/usr/bin/env bash
# Phase-47083: client soft_fertig_ssh_auth_soft_49840_echo_roster Soft 47080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_49840_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47080+ soft_fertig_ssh_auth_soft_49840_echo_roster type ok"; echo "cleaned"; echo "OK: phase47083 e2e passed"
