//
    Shows an inline clickable icon (or a button) that opens a given URL in the docs

    @attribute button (atomic)
        If set, shows a button instead of an icon
    @attribute title (string)
        A title shown when hovering over an icon, or a label in the button if `button` is present.
    @attribute hidelabel (atomic)
        Doesn't show a label inside a button if set
    @attribute path (string)
        A relative path to a needed doc page.

docs-shortcut
    span(title="{opts.title || voc.openDocs}" onclick="{navigateToDocs}" if="{!opts.button}")
        svg.feather.a
            use(xlink:href="#book-open")
    button(onclick="{navigateToDocs}" if="{opts.button}" class="{wide: opts.wide}")
        svg.feather
            use(xlink:href="#book-open")
        span(if="{!opts.hidelabel}") {opts.title || voc.openDocs}
    script.
        this.namespace = 'docsShortcut';
        this.mixin(window.riotVoc);
        this.navigateToDocs = () => {
            window.signals.trigger('openDocs', {
                path: this.opts.path || '/'
            });
        };
