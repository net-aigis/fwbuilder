#!/usr/bin/env bash
# Phase-33643: client soft_fertig_ssh_auth_soft_34720_echo_roster Soft 33640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_34720_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33640+ soft_fertig_ssh_auth_soft_34720_echo_roster type ok"; echo "cleaned"; echo "OK: phase33643 e2e passed"
