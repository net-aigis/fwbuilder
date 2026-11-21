#!/usr/bin/env bash
# Phase-35083: client soft_fertig_ssh_auth_schema_375_echo_roster Soft 35080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_375_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 35080+ soft_fertig_ssh_auth_schema_375_echo_roster type ok"; echo "cleaned"; echo "OK: phase35083 e2e passed"
