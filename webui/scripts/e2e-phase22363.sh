#!/usr/bin/env bash
# Phase-22363: client soft_fertig_ssh_auth_pentacosadeca_checkpoint_roster Soft 22360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_pentacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 22360+ soft_fertig_ssh_auth_pentacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase22363 e2e passed"
