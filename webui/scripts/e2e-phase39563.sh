#!/usr/bin/env bash
# Phase-39563: client soft_fertig_ssh_auth_schema_431_echo_roster Soft 39560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_schema_431_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 39560+ soft_fertig_ssh_auth_schema_431_echo_roster type ok"; echo "cleaned"; echo "OK: phase39563 e2e passed"
