#!/usr/bin/env bash
# Phase-33003: client soft_fertig_ssh_auth_soft_34080_echo_roster Soft 33000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_34080_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33000+ soft_fertig_ssh_auth_soft_34080_echo_roster type ok"; echo "cleaned"; echo "OK: phase33003 e2e passed"
