export default {
	url_open
}

function url_open(url) {
	try {
		if (process.env.BUILD_TARGET !== 'web') {
			this.$electron.shell.openExternal(url)
		} else {
			window.open(url)
		}
	} catch (e) {
		window.open(url)
	}
}
