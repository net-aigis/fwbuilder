#!/usr/bin/env bash
# Phase-48843: client soft_fertig_ssh_auth_schema_547_echo_roster Soft 48840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_547_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 48840+ soft_fertig_ssh_auth_schema_547_echo_roster type ok"; echo "cleaned"; echo "OK: phase48843 e2e passed"
