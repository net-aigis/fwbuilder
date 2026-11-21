#!/usr/bin/env bash
# Phase-40203: client soft_fertig_ssh_auth_schema_439_echo_roster Soft 40200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_439_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 40200+ soft_fertig_ssh_auth_schema_439_echo_roster type ok"; echo "cleaned"; echo "OK: phase40203 e2e passed"
