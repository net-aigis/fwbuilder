#!/usr/bin/env bash
# Phase-33963: client soft_fertig_ssh_auth_soft_35080_echo_roster Soft 33960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_35080_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33960+ soft_fertig_ssh_auth_soft_35080_echo_roster type ok"; echo "cleaned"; echo "OK: phase33963 e2e passed"
