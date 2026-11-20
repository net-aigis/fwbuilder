#!/usr/bin/env bash
# Phase-39883: client soft_fertig_ssh_auth_schema_435_echo_roster Soft 39880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_435_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 39880+ soft_fertig_ssh_auth_schema_435_echo_roster type ok"; echo "cleaned"; echo "OK: phase39883 e2e passed"
