document.addEventListener('DOMContentLoaded', function() {
    // URL 파라미터에서 count 값을 가져옵니다.
    const urlParams = new URLSearchParams(window.location.search);
    const count = urlParams.get('count') || 0;

    // count 값을 화면에 표시합니다.
    document.getElementById('displayCount').textContent = count;

    // 일정 시간이 지나면 redirectUrl로 리다이렉트합니다.
    setTimeout(function() {
        window.location.href = redirectUrl;
    }, 2000);  // 5초 후 리다이렉트
});
