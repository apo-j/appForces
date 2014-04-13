PageConfig.delete_all
Page.delete_all
PageConfig.delete_all
pc = PageConfig.create(domainName: 'localhost', appId: 1, appName: 'Iluxe-Privee',   faviconUrl: 'http://www.w3schools.com/favicon.ico', appTouchFaviconUrl: '', styleId:"styles/iluxe.less", languageId: 1,)
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '100', title: 'Sign_in', code: 'spSignin', url: '/signin', isIndexPage: false, layoutUrl: 'contact')
p.pageSecurity = ps
pc.pages<<p
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '101', title: 'Sign_up', code: 'spSignup', url: '/signup', isIndexPage: false, layoutUrl: 'contact')
p.pageSecurity = ps
pc.pages<<p
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '102', title: 'Not found', code: 'sp404', url: '/404', isIndexPage: false, layoutUrl: 'contact')
p.pageSecurity = ps
pc.pages<<p
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '104', title: 'Unautorized', code: 'sp401', url: '/401', isIndexPage: false, layoutUrl: 'contact')
p.pageSecurity = ps
pc.pages<<p
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '103', title: 'Server error', code: 'sp500', url: '/500', isIndexPage: false, layoutUrl: 'contact')
p.pageSecurity = ps
pc.pages<<p
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '0', title: 'Iluxe-Privee', code: 'index', url: '/', isIndexPage: true, layoutUrl: 'main')
p.pageSecurity = ps
pc.pages<<p
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '0', title: 'about', code: 'about', url: '/about', isIndexPage: false, layoutUrl: 'about')
p.pageSecurity = ps
pc.pages<<p
ps = PageSecurity.create(requireLogin:false, token:'')
p = Page.create(afType: '0', title: 'contact', code: 'contact', url: '/contact', isIndexPage: false, layoutUrl: 'contact')
p.pageSecurity = ps
pc.pages<<p