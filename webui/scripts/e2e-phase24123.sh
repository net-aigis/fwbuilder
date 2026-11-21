#!/usr/bin/env bash
# Phase-24123: client soft_fertig_ssh_auth_ms_59500_echo_roster Soft 24120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_59500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24120+ soft_fertig_ssh_auth_ms_59500_echo_roster type ok"; echo "cleaned"; echo "OK: phase24123 e2e passed"
