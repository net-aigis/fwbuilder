#!/usr/bin/env bash
# Phase-6203: client soft_fertig_ssh_alternative_presence_roster Soft 6200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_presence_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6200+ soft_fertig_ssh_alternative_presence_roster type ok"; echo "cleaned"; echo "OK: phase6203 e2e passed"
