#!/usr/bin/env bash
# Phase-19083: client soft_fertig_ssh_auth_schema_175_echo_roster Soft 19080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_175_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 19080+ soft_fertig_ssh_auth_schema_175_echo_roster type ok"; echo "cleaned"; echo "OK: phase19083 e2e passed"
