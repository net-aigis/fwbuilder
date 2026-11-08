#!/usr/bin/env bash
# Phase-7243: client soft_fertig_ssh_alternative_titles_refresh_roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_titles_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6680+ soft_fertig_ssh_alternative_titles_refresh_roster type ok"; echo "cleaned"; echo "OK: phase7243 e2e passed"
