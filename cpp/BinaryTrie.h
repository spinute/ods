/*
 * BinaryTrie.h
 *
 *  Created on: 2012-01-26
 *      Author: morin
 */

#ifndef BINARYTRIE_H_
#define BINARYTRIE_H_

#include<cstdlib>

namespace ods {

template<class N, class T>
class BinaryTrieNode {
public:
	T x;
	N *jump;
	N *parent;
	union {
		struct {
			N *left;
			N *right;
		};
		struct {
			N *prev;
			N *next;
		};
		N* child[2];
	};
	BinaryTrieNode() {
		left = right = parent = jump = NULL;
	}
};

template<class Node, class T>
class BinaryTrie {
protected:
	T null;
	enum { left, right };
	enum { prev, next };
	Node r;
	Node dummy;
	int n;
	static const int w = 32;  // FIXME: portability
	void clear(Node *u, int d);

public:
	BinaryTrie();
	virtual ~BinaryTrie();
	bool add(T x);
	bool remove(T x);
	T find(T x);
	int size() { return n; }
	void clear();
};



template<class Node, class T>
BinaryTrie<Node,T>::BinaryTrie() {
	// FIXME: we have to initialize to something reasonable, i.e., null = (T)NULL;
	dummy.next = &dummy;
	dummy.prev = &dummy;
	r.jump = &dummy;
	n = 0;
}

template<class Node, class T>
BinaryTrie<Node,T>::~BinaryTrie() {
	clear();
}

template<class Node, class T>
void BinaryTrie<Node,T>::clear() {
	clear(&r, 0);
	dummy.next = &dummy;
	dummy.prev = &dummy;
	r.jump = &dummy;
	r.left = NULL;
	r.right = NULL;
	n = 0;
	// TODO: recursive cleanup
}

template<class Node, class T>
void BinaryTrie<Node,T>::clear(Node *u, int d) {
	if (u == NULL) return;
	if (d < w) {
		clear(u->left, d+1);
		clear(u->right, d+1);
	}
	if (d > 0)
		delete u;
}

template<class Node, class T>
bool BinaryTrie<Node,T>::add(T x) {
	int i, c = 0;
	unsigned ix = intValue(x);
	Node *u = &r;
	// 1. 木の端に着くまで ix を探す
	for (i = 0; i < w; i++) {
		c = (ix >> (w-i-1)) & 1;
		if (u->child[c] == NULL) break;
		u = u->child[c];
	}
	if (i == w) return false; // x はすでに入っているので中止する
	Node *pred = (c == right) ? u->jump : u->jump->left;
	u->jump = NULL;  // u は2つの子を持つようになる
	// 2. ix への経路を追加する
	for (; i < w; i++) {
		c = (ix >> (w-i-1)) & 1;
		u->child[c] = new Node();
		u->child[c]->parent = u;
		u = u->child[c];
	}
	u->x = x;
	// 3. u を連結リストに追加する
	u->prev = pred;
	u->next = pred->next;;
	u->prev->next = u;
	u->next->prev = u;
	// 4. 上に戻りながら jump ポインタを更新する
	Node *v = u->parent;
	while (v != NULL) {
		if ((v->left == NULL
				&& (v->jump == NULL || intValue(v->jump->x) > ix))
		|| (v->right == NULL
				&& (v->jump == NULL || intValue(v->jump->x) < ix)))
			v->jump = u;
		v = v->parent;
	}
	n++;
	return true;
}

template<class Node, class T>
T BinaryTrie<Node,T>::find(T x) {
	int i, c = 0;
	unsigned ix = intValue(x);
	Node *u = &r;
	for (i = 0; i < w; i++) {
		c = (ix >> (w-i-1)) & 1;
		if (u->child[c] == NULL) break;
		u = u->child[c];
	}
	if (i == w) return u->x;  // 見つけた
	u = (c == 0) ? u->jump : u->jump->next;
	return u == &dummy ? null : u->x;
}


template<class Node, class T>
bool BinaryTrie<Node,T>::remove(T x) {
	// 1. x を含む葉 u を見つける
	int i = 0, c;
	unsigned ix = intValue(x);
	Node *u = &r;
	for (i = 0; i < w; i++) {
		c = (ix >> (w-i-1)) & 1;
		if (u->child[c] == NULL) return false;
		u = u->child[c];
	}
	// 2. u を連結リストから削除する
	u->prev->next = u->next;
	u->next->prev = u->prev;
	Node *v = u;
	// 3. u を根から u への経路上のノードから削除する
	for (i = w-1; i >= 0; i--) {
		c = (ix >> (w-i-1)) & 1;
		v = v->parent;
		delete v->child[c];
		v->child[c] = NULL;
		if (v->child[1-c] != NULL) break;
	}
	// 4. jump ポインタを更新する
	c = (ix >> (w-i-1)) & 1;
	v->jump = u->child[1-c];
	v = v->parent;
	i--;
	for (; i >= 0; i--) {
		c = (ix >> (w-i-1)) & 1;
		if (v->jump == u)
			v->jump = u->child[1-c];
		v = v->parent;
	}
	n--;
	return true;
}


template<class T>
class BinaryTrieNode1 : public BinaryTrieNode<BinaryTrieNode1<T>, T> { };

template<class T>
class BinaryTrie1 : public BinaryTrie<BinaryTrieNode1<T>, T> { };



} /* namespace ods */
#endif /* BINARYTRIE_H_ */
