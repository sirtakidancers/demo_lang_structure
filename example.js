import Twig from 'twig';

import fn from 'fn'; // just a helper, with functions assistants where there is i18n.

// fn.i18n(msgid) -> msgstr

Twig.renderFile('./example.twig', { js_lang: fn.i18n('error.api.general') });