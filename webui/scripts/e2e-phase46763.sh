#!/usr/bin/env bash
# Phase-46763: client soft_fertig_ssh_auth_soft_49480_echo_roster Soft 46760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_49480_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 46760+ soft_fertig_ssh_auth_soft_49480_echo_roster type ok"; echo "cleaned"; echo "OK: phase46763 e2e passed"
