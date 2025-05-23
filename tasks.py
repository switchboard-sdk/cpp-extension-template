from invoke import task, Context

import os

PROJECT_DIR = os.path.dirname(os.path.abspath(__file__))

@task
def setup(ctx):
    """Set up ExampleDSP Extension"""
    pass

@task
def clean(ctx):
    """Clean ExampleDSP Extension"""
    pass

@task
def rename(ctx):
    ctx.run("scripts/rename.sh")

@task
def build_macos(ctx):
    """Build the macOS version of the ExampleDSP Extension"""
    pass

@task
def build_linux(ctx):
    """Build the Linux version of the ExampleDSP Extension"""
    pass

@task
def build_windows(ctx):
    """Build the Windows version of the ExampleDSP Extension"""
    pass