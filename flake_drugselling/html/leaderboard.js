var leaderboardOpen = false;

window.addEventListener('message', function(event) {
    var data = event.data;
    if (data.action === 'showLeaderboard') {
        // Apply color FIRST, before any DOM changes, so everything renders correct color
        if (data.config && data.config.uiColor && window.applyUIColor) {
            window.applyUIColor(data.config.uiColor);
        }
        showLeaderboard(data.leaderboard, data.config);
    } else if (data.action === 'hideLeaderboard') {
        hideLeaderboard();
    }
});

function showLeaderboard(leaderboard, config) {
    var container = document.getElementById('leaderboard-container');
    var list = document.getElementById('leaderboard-list');
    var card = document.querySelector('.leaderboard-card');

    if (config) {
        if (config.title)    document.getElementById('header-title').textContent = config.title;
        if (config.subtitle) document.getElementById('header-subtitle').textContent = config.subtitle;
        if (config.seasonText) document.getElementById('season-text').textContent = config.seasonText;

        var imageWrapper = document.getElementById('header-image-wrapper');
        var trophy       = document.getElementById('header-trophy');
        var imgEl        = document.getElementById('leaderboard-header-image');

        if (config.headerImage && config.headerImage.trim() !== '') {
            imgEl.src = config.headerImage;
            imageWrapper.style.display = 'block';
            trophy.style.display = 'none';
            card.classList.add('has-image');

            imgEl.onerror = function() {
                // Image failed to load — fall back gracefully to trophy
                imageWrapper.style.display = 'none';
                trophy.style.display = 'block';
                card.classList.remove('has-image');
            };
        } else {
            imageWrapper.style.display = 'none';
            trophy.style.display = 'block';
            card.classList.remove('has-image');
        }
    }

    // Build entries
    list.innerHTML = '';

    if (!leaderboard || leaderboard.length === 0) {
        list.innerHTML =
            '<div class="empty-state">' +
                '<div class="empty-state-icon">📊</div>' +
                '<div class="empty-state-text">No dealers on the leaderboard yet</div>' +
            '</div>';
    } else {
        leaderboard.forEach(function(entry, index) {
            var rank = index + 1;
            var rankClass = rank <= 3 ? ' rank-' + rank : '';
            var el = document.createElement('div');
            el.className = 'leaderboard-entry' + rankClass;
            el.style.animationDelay = (index * 0.05) + 's';
            el.innerHTML =
                '<div class="entry-rank">'   + rank                       + '</div>' +
                '<div class="entry-dealer">' + sanitize(entry.name)       + '</div>' +
                '<div class="entry-title">'  + sanitize(entry.title)      + '</div>' +
                '<div class="entry-xp">'     + formatXP(entry.xp) + ' XP' + '</div>';
            list.appendChild(el);
        });
    }

    container.style.display = 'block';
    leaderboardOpen = true;
}

function hideLeaderboard() {
    document.getElementById('leaderboard-container').style.display = 'none';
    leaderboardOpen = false;
}

function formatXP(xp) {
    return xp.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

function sanitize(str) {
    if (!str) return '';
    var map = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#039;' };
    return str.replace(/[&<>"']/g, function(c) { return map[c]; });
}

function getResourceName() {
    var name = 'flake_drugselling';
    try {
        if (window.location.ancestorOrigins && window.location.ancestorOrigins[0]) {
            var m = window.location.ancestorOrigins[0].match(/https?:\/\/(.+)/);
            if (m) name = m[1];
        }
    } catch(e) {}
    return name;
}

document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && leaderboardOpen) {
        hideLeaderboard();
        fetch('https://' + getResourceName() + '/closeLeaderboard', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({})
        }).catch(function(){});
    }
});