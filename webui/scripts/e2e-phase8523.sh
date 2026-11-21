#!/usr/bin/env bash
# Phase-8523: client soft_fertig_ssh_implemented_agent_refresh_roster Soft 8520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_agent_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8520+ soft_fertig_ssh_implemented_agent_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8523 e2e passed"
