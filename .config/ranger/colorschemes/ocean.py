# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.


from __future__ import (absolute_import, division, print_function)
from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black, white,
    red, green, blue, yellow, cyan, magenta,
    default, normal, bold, reverse, dim, BRIGHT,
    default_colors,
)


class Sea(ColorScheme):
    progress_bar_color = blue

    def use(self, context):
        fg, bg, attr = default_colors
        if context.reset:
            return default_colors
        elif context.in_browser:


            if context.border:
                fg = default
            if context.main_column:
                if context.selected:
                    attr |= reverse
                    attr |= bold
            if context.selected:
                bg = black
            else:
                attr = normal
            if not context.selected and (context.cut or context.copied):
                attr |= bold
                fg = black
                fg += BRIGHT
                if BRIGHT == 0:
                    attr |= dim
                    fg = white

            if context.directory:
                fg = blue
                fg += BRIGHT
                attr |= bold
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                fg = green
            if context.link:
                fg = blue if context.good else magenta
            if context.container:
                fg = red

            if context.media:
                fg = cyan
            if context.socket:
                fg = magenta
            if context.fifo:
                fg = yellow
            if context.device:
                fg = white

            if context.marked:
                fg = yellow
            if context.tag_marker and not context.selected:
                if fg in (red, magenta):
                    fg = white
                else:
                    fg = red
                fg += BRIGHT
            if context.empty:
                bg = magenta
            if context.error:
                bg = red
            if context.badinfo:
                if attr & reverse:
                    bg = red
                else:
                    fg = red

            if context.inactive_pane:
                fg = black
                fg += BRIGHT


        elif context.in_titlebar:
            if context.hostname:
                fg = red if context.bad else yellow
            elif context.directory:
                fg = cyan
            elif context.tab:
                if context.good:
                    bg = green
            elif context.link:
                fg = blue
            attr |= bold

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = cyan
                elif context.bad:
                    fg = magenta
            if context.marked:
                attr |= bold | reverse
                fg = yellow
                fg += BRIGHT
            if context.frozen:
                attr |= bold | reverse
                fg = cyan
                fg += BRIGHT
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = red
                    fg += BRIGHT
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = blue
                attr &= ~bold
            if context.vcscommit:
                fg = yellow
                attr &= ~bold
            if context.vcsdate:
                fg = cyan
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = magenta
            elif context.vcsuntracked:
                fg = cyan
            elif context.vcschanged:
                fg = red
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = green
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                fg = green
            elif context.vcsbehind:
                fg = red
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = magenta
            elif context.vcsunknown:
                fg = red

        return fg, bg, attr


