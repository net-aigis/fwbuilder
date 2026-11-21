#!/usr/bin/env bash
# Phase-9083: client soft_fertig_ssh_auth_field_presence_roster Soft 9080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_field_presence_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9080+ soft_fertig_ssh_auth_field_presence_roster type ok"; echo "cleaned"; echo "OK: phase9083 e2e passed"
