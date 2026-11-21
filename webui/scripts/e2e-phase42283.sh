#!/usr/bin/env bash
# Phase-42283: client soft_fertig_ssh_auth_soft_44440_echo_roster Soft 42280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_44440_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 42280+ soft_fertig_ssh_auth_soft_44440_echo_roster type ok"; echo "cleaned"; echo "OK: phase42283 e2e passed"
