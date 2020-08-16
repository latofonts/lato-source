#!/usr/bin/env python3
import os
import os.path
from fontmake.font_project import FontProject
from ufo2ft import CFFOptimization

class LatoFontMake(object):

    def __init__(self, config):
        self.build = config.get('build', 'all')
        self.cwd = os.path.dirname(__file__)
        self.basefonts = {
            'Lato3Upr': None,
            'Lato3Ita': None,
        }
        if self.build in ('all', 'vf', 'vf2'):
            for basefont in self.basefonts:
                self.buildVF2(basefont)
        if self.build in ('all', 'vf', 'vf3'):
            for basefont in self.basefonts:
                self.buildVF3(basefont)
        if self.build in ('all', 'ttf'):
            for basefont in self.basefonts:
                self.buildTTF(basefont)
        if self.build in ('all', 'otf'):
            for basefont in self.basefonts:
                self.buildOTF(basefont)
        if self.build in ('test'):
            for basefont in self.basefonts:
                self.buildTest(basefont)

    def build_fontmake(self, designspace_path, output = ['variable'], output_dir = None, remove_overlaps = False, interpolate = False, autohint = None):
        if not os.path.isdir(output_dir):
            os.makedirs(output_dir)
        project = FontProject()
        fontmake_args = {
            'output': output,
            'output_path': None,
            'output_dir': output_dir,
            # 'feature_writers': None,
            'interpolate': interpolate,
            'remove_overlaps': remove_overlaps,
            'overlaps_backend': 'booleanOperations',
            'autohint': autohint,
            'use_production_names': False
        }
        if 'variable' in output:
            fontmake_args['optimize_gvar'] = True
        if 'otf' in output:
            fontmake_args['optimize_cff'] = CFFOptimization.SUBROUTINIZE
        print(
            project.run_from_designspace(
                designspace_path=designspace_path,
                **fontmake_args)
            )

    def buildVF2(self, basefont):
        print('\n\nBuilding %s 2-master TTF VF...' % basefont)
        designspace_path = os.path.join(self.cwd, '..', 'sources', basefont+'2M.designspace')
        output = ['variable']
        output_dir = os.path.join('..', 'build', basefont+'2M', 'vf-2master')
        remove_overlaps = False
        interpolate = False
        self.build_fontmake(designspace_path, output, output_dir, remove_overlaps, interpolate)

    def buildVF3(self, basefont):
        print('\n\nBuilding %s 3-master TTF VF...' % basefont)
        designspace_path = os.path.join(self.cwd, '..', 'sources', basefont+'3M.designspace')
        output = ['variable']
        output_dir = os.path.join('..', 'build', basefont+'2M', 'vf-3master')
        remove_overlaps = False
        interpolate = False
        self.build_fontmake(designspace_path, output, output_dir, remove_overlaps, interpolate)

    def buildTTF(self, basefont):
        print('\n\nBuilding %s static TTFs...' % basefont)
        designspace_path = os.path.join(self.cwd, '..', 'sources', basefont+'2M.designspace')
        output = ['ttf']
        output_dir = os.path.join('..', 'build', basefont+'2M', 'static-ttf')
        remove_overlaps = True
        interpolate = True
        self.build_fontmake(designspace_path, output, output_dir, remove_overlaps, interpolate)

    def buildOTF(self, basefont):
        print('\n\nBuilding %s static OTFs...' % basefont)
        designspace_path = os.path.join(self.cwd, '..', 'sources', basefont+'2M.designspace')
        output = ['otf']
        output_dir = os.path.join('..', 'build', basefont+'2M', 'static-otf')
        remove_overlaps = True
        interpolate = True
        self.build_fontmake(designspace_path, output, output_dir, remove_overlaps, interpolate)

    def buildTest(self, basefont):
        print('\n\nBuilding %s test font...' % basefont)
        designspace_path = os.path.join(self.cwd, '..', 'sources', basefont+'Test.designspace')
        output = ['ttf']
        output_dir = os.path.join('..', 'build', basefont+'Test', 'test-ttf')
        remove_overlaps = True
        interpolate = True
        self.build_fontmake(designspace_path, output, output_dir, remove_overlaps, interpolate)

if __name__ == "__main__":
    import argparse

    # ...
    parser = argparse.ArgumentParser(
        prog="build_lato_fontmake",
        description="""Build Lato variable and static fonts from DesignSpace+UFO\
                        source using fontmake"""
    )
    parser.add_argument(
        "build",
        nargs="?",
        default='all',
        choices=['all', 'vf', 'vf2', 'vf3', 'otf', 'ttf', 'test']
    )

    mk = LatoFontMake(vars(parser.parse_args()))
