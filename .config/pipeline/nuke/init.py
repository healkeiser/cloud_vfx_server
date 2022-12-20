# -*- coding: utf-8 -*-
"""Init script for Nuke."""

# ------ Libraries
import os, sys, platform, nuke

# ------ Metadatas
__author__ = "Valentin Beaumont"
__email__ = "valentin.onze@gmail.com"

###### CODE ####################################################################

def loadPlugins():
  nuke_path = os.getenv("NUKE_PATH")
  nuke.pluginAddPath(os.path.join(nuke_path, "plugins/valentin"))
  nuke.pluginAddPath(os.path.join(nuke_path, "plugins/python_editor"))
  nuke.pluginAddPath(os.path.join(nuke_path, "plugins/nuke_survival_toolkit"))

if __name__ == "__main__":
    loadPlugins()
