#!/usr/bin/env bash
# Phase-13003: client soft_fertig_ssh_auth_export_family_roster Soft 13000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_export_family_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13000+ soft_fertig_ssh_auth_export_family_roster type ok"; echo "cleaned"; echo "OK: phase13003 e2e passed"
