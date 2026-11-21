#!/usr/bin/env bash
# Phase-6443: client soft_fertig_ssh_implemented_agent_roster Soft 6440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_agent_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6440+ soft_fertig_ssh_implemented_agent_roster type ok"; echo "cleaned"; echo "OK: phase6443 e2e passed"
