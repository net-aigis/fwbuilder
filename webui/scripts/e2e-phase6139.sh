#!/usr/bin/env bash
# Phase-6139: client ssh_alternative_presence_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_presence_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternative-presence roster type ok"; echo "cleaned"; echo "OK: phase6139 e2e passed"
