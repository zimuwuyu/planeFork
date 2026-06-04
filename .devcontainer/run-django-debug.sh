#!/bin/bash
set -e

echo "🔧 Starting Django API with debugpy..."

# Navigate to API directory
cd /workspace/apps/api

# Install debugpy if not already installed
if ! python -c "import debugpy" 2>/dev/null; then
    echo "📦 Installing debugpy..."
    pip install debugpy
fi

# Set environment variables
export PYTHONUNBUFFERED=1
export DEBUG=true

# Run Django with debugpy
echo "🚀 Django is starting on http://localhost:8000"
echo "🔌 Debugger listening on localhost:5678"
echo "📌 Attach the debugger in VS Code using 'Django in Dev Container' configuration"
echo ""

python -m debugpy.adapter --listen 0.0.0.0:5678 --wait-for-client --log-dir /tmp ./manage.py runserver 0.0.0.0:8000
