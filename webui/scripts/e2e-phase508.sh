#!/usr/bin/env bash
# Phase-508: hard-gap note mentions field-ui-hidden / layout_tree_max_depth.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'field-ui-hidden' webui/backend/fwbweb_api/main.py
grep -Fq 'layout_tree_max_depth' webui/backend/fwbweb_api/main.py
echo "hard-gap note hidden/tree ok"
echo "cleaned"
echo "OK: phase508 e2e passed"
