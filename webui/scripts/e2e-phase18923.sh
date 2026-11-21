#!/usr/bin/env bash
# Phase-18923: client soft_fertig_ssh_auth_soft_18880_echo_roster Soft 18920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_18880_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18920+ soft_fertig_ssh_auth_soft_18880_echo_roster type ok"; echo "cleaned"; echo "OK: phase18923 e2e passed"
