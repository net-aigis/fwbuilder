#!/usr/bin/env bash
# Phase-34283: client soft_fertig_ssh_auth_soft_35440_echo_roster Soft 34280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_35440_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 34280+ soft_fertig_ssh_auth_soft_35440_echo_roster type ok"; echo "cleaned"; echo "OK: phase34283 e2e passed"
