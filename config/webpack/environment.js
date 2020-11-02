const { environment } = require('@rails/webpacker')

// jqueryを読み込む記述
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
// jqueryを読み込む記述

module.exports = environment
