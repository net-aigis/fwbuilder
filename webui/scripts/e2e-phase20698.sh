#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthIcosadecaCheckpointRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-icosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase20698 e2e passed"
