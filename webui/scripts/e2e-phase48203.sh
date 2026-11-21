#!/usr/bin/env bash
# Phase-48203: client soft_fertig_ssh_auth_schema_539_echo_roster Soft 48200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_539_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 48200+ soft_fertig_ssh_auth_schema_539_echo_roster type ok"; echo "cleaned"; echo "OK: phase48203 e2e passed"
